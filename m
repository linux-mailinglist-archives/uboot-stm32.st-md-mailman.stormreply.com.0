Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E92EA2C6866
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 16:05:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FF66C56630;
	Fri, 27 Nov 2020 15:05:06 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64AFAC36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 15:05:04 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id cv2so2414501qvb.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 07:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Os6SicO3p0GCTR89RfH8zLY9tvDNlkq7unc+w8qz7U=;
 b=BOJG7hcLo8En3ToHWjGhOgHtzdMX3pfVcTLqXX2/NkJSF5Rpf6HUWE7gK9HYMe45KQ
 DWoz46M4KwGD/EyTNQdf7myvq4kZX8KOQPy9OWNy7kYP1TR1EZYlw3XrpWyzlcOInuc9
 +btfaIITHXfvcxl/aDwKCSC6EQ4rIFyyrbWraj2/4ft5NXNha3yXOqOBkWwJ2K949xzZ
 YdcrNNWojHLHsXt9Y/DlZkPHRqYA0JZVmoI4fcn6cwil7uEW5dMAP/TfxYuZdzLTHKf3
 S1ybrpayYpx3J9kYnDr74HSQOGej5o8Y/YhRhig611D2eJwUN57Z+kBAvxmLlHPiuskx
 5fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Os6SicO3p0GCTR89RfH8zLY9tvDNlkq7unc+w8qz7U=;
 b=QKUIvC4bexZzTfU2gO4o1hpmC0bSFSSwNhAQPnQHwEUP3QMTw3Bi+Xni56Fjjuiwlr
 RP5ZxR2Z8KEF56i/CNE7kw1CNl/yWqPayJ4KR+i20VZUxDliyPErJnYI94aBjyTlh/1x
 iGhXanOsJmTm3KUIcN1yuurCTVGBOzp/KECkXORc6WQB3xmw2xc8NGYByY5XYkRsDYMZ
 Eaqpyl2ZWA6IkHfAItpcLxNJW20rqFVHBxtYktyWP9tVPj9y2c+GBFiU7aCmPca/m23t
 JbWwBVP/JCPE1SwdJRt26c+w+QHovVf2LpWFE9DT8sqx4zdiHiMmuGa0GbgWlDJD/muT
 ZYqg==
X-Gm-Message-State: AOAM531c5Me/7Q5nbX6lx2MB9IDrrvh9yUquDJMAA2SSGdX5jya9rtKH
 GBApNhWQxb5RpBXhkpIf+KiZKn1u/pF1BA==
X-Google-Smtp-Source: ABdhPJwed9YTwPnur1zF0l2ZUccfGSYwvxeGVb2iPzAouvlSRl70Dne5WepZMnPEdPcrB30ONesbRg==
X-Received: by 2002:ad4:4743:: with SMTP id c3mr8787450qvx.31.1606489502966;
 Fri, 27 Nov 2020 07:05:02 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id g4sm5937309qtu.82.2020.11.27.07.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 07:05:02 -0800 (PST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-5-patrick.delaunay@st.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <8b1a1455-953a-b593-8489-cea3f7ab6264@gmail.com>
Date: Fri, 27 Nov 2020 10:05:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201127102100.11721-5-patrick.delaunay@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Anatolij Gustschin <agust@denx.de>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 6/9] console: remove duplicated test on
	gd value
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 11/27/20 5:20 AM, Patrick Delaunay wrote:
> Reorder test on gd value and remove the duplicated test (!gd)
> in putc and puts function.
> 
> This patch is a preliminary step for rework of this function.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2:
> - update gd test in console function puts and putc (cosmetic)
> 
>   common/console.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/common/console.c b/common/console.c
> index 3348436da6..70579af042 100644
> --- a/common/console.c
> +++ b/common/console.c
> @@ -517,22 +517,22 @@ static inline void print_pre_console_buffer(int flushpoint) {}
>   
>   void putc(const char c)
>   {
> +	if (!gd)
> +		return;
>   #ifdef CONFIG_SANDBOX
>   	/* sandbox can send characters to stdout before it has a console */
> -	if (!gd || !(gd->flags & GD_FLG_SERIAL_READY)) {
> +	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
>   		os_putc(c);
>   		return;
>   	}
>   #endif
>   #ifdef CONFIG_DEBUG_UART
>   	/* if we don't have a console yet, use the debug UART */
> -	if (!gd || !(gd->flags & GD_FLG_SERIAL_READY)) {
> +	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
>   		printch(c);
>   		return;
>   	}
>   #endif
> -	if (!gd)
> -		return;
>   #ifdef CONFIG_CONSOLE_RECORD
>   	if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
>   		membuff_putbyte((struct membuff *)&gd->console_out, c);
> @@ -565,15 +565,17 @@ void putc(const char c)
>   
>   void puts(const char *s)
>   {
> +	if (!gd)
> +		return;
>   #ifdef CONFIG_SANDBOX
>   	/* sandbox can send characters to stdout before it has a console */
> -	if (!gd || !(gd->flags & GD_FLG_SERIAL_READY)) {
> +	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
>   		os_puts(s);
>   		return;
>   	}
>   #endif
>   #ifdef CONFIG_DEBUG_UART
> -	if (!gd || !(gd->flags & GD_FLG_SERIAL_READY)) {
> +	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
>   		while (*s) {
>   			int ch = *s++;
>   
> @@ -582,8 +584,6 @@ void puts(const char *s)
>   		return;
>   	}
>   #endif
> -	if (!gd)
> -		return;
>   #ifdef CONFIG_CONSOLE_RECORD
>   	if ((gd->flags & GD_FLG_RECORD) && gd->console_out.start)
>   		membuff_put((struct membuff *)&gd->console_out, s, strlen(s));
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
