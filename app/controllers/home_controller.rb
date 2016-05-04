class HomeController < ApplicationController
    
    def input
    end
    
    def output
        
        #수원 중앙도서관
        book_name = params[:book_name_input]
        @encode_name ="http://ct.suwonlib.go.kr/html/02_search/?a_v=f&a_qf=Z&a_q=" + URI.encode(book_name)
        @html = Nokogiri::HTML(Net::HTTP.get(URI(@encode_name)))

        #도서 이름
        @title = @html.css("h4.title//a")
        @title_array = Array.new
        
=begin       @title.each do |i|
            @title_array = i #1개밖에 안구해진다... 연구필요
=end       end
         
        #도서설명
        @text_array = Array.new
        @text = @html.css('li//p.author').inner_text
        
        # for p_html in @text do
        #     if p_html['p'].include? 'author' ###만일 @images 안에 저장된 image_html코드들 중에서 src태그인데 'i1.cartoon.daumcdn.net'이라는 문자열을 포함한다면
        #         @text_array.push(p_html['p']) ##image_html에 src태그 코드를 @image_samples라는 비어있는 array에 넣어라.        
        #     end
        # end
        # for image_html in @text do ########노코기리로 불러오고 저장한 @images 에 있는 image_html코드들 중에서 어떠한 것을 반복한다. (image_html은 지역변수가 아니라 명령어(약속어) ) 
        #     @text_array = @text
        # end


 #도서 이미지
        @image = @html.css("#A-LibMPageSearchList//img")
        @image_samples = Array.new 
        @image_samples_2 = Array.new
        
        
        
        for image_html in @image do
            if image_html['src'].include? 'image.aladin.co.kr/product' ###만일 @images 안에 저장된 image_html코드들 중에서 src태그인데 'image.aladin.co.kr/product'이라는 문자열을 포함한다면
                @image_samples.push(image_html['src']) ##image_html에 src태그 코드를 @image_samples라는 비어있는 array에 넣어라.        
            end
            if image_html['alt']###만일 @images 안에 저장된 image_html코드들 중에서 alt태그인데 'image.aladin.co.kr/product'이라는 문자열을 포함한다면
                @image_samples_2.push(image_html['alt'])##image_html에 alt태그 코드를 @image_samples_2라는 비어있는 array에 넣어라.        
            
            end
        end
    end
end

