Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED515815169
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Dec 2023 21:51:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF0DAC6DD6D;
	Fri, 15 Dec 2023 20:51:15 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 868D1C6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 20:51:14 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-67f040e6722so5596216d6.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 12:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702673473; x=1703278273;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TPhRiiZb6KtBM+Tdst055w3ClspZmou2qDYxHA/ur2c=;
 b=TN5fKLghM5XCpIZ2UFfFBc8hW58sK31IuybweJkbHJ89WSTaAcjA+bTFeVnOZPdZd6
 TIPd80qkLUKi92SdbwZa9LrDORH9y0v/Tln5/DJo8vaIrcX8xogiZJ5OMJOLVJx3vs2W
 PBtQjqu/QkpXGIKV2Gh7LHlVPZsQhelwaJbiZ9UxvsLffhZfH4aZdjx051cQZ1JQCsr9
 F9GBKleVPEwvt7aL06O0Iktieu21c1HeQ5OQ6ZkTrz5Mxnv7BEQyIFpQ8ylYYuzLXIT0
 V/4o/clJxigqXXgG2lxLpeXAv+LuQuUygbqAzG6+EN+OsNdT4NlYtzl1W19+Q4pmL65L
 pDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702673473; x=1703278273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TPhRiiZb6KtBM+Tdst055w3ClspZmou2qDYxHA/ur2c=;
 b=nnZ7qy2BQBwvEYplSzvG7+LeaFHrlTXr8aoaaLNeLAl33a85GK8Bcx0TZuJPW+Im7T
 dL7RQcDqfD3fZTAqhUJykrvlv9pgtfyU2nQGVyxuPa1pCjCKkuFq/yE66ETRaoRtKIZK
 TfDfYBJW/llPfCno4gcXsNr0KNIbiS6YC0QxE0CCXG8Mvn78ahIVZTs7ipTOKeQKQHOb
 zoaKIaWNXRd89EONKWQHtL2xahq8z8bRWemxrmsqVZDIdC1gWoC9j6atLXKBpmUxbOMh
 x0cvBHDEmQDMQzNaUuoDw4M2lxfEYm2KIiK4puNcKO1kGM9f9Z/KKp2ya2yo+PD9fYMF
 Nwdw==
X-Gm-Message-State: AOJu0YwAPdMYL2WJnjBsP0yx7GRvz5vmvm9iqKTBRlcrZKhkuBN1FF4s
 2oGfdgRzMbePRzIRg39en1c=
X-Google-Smtp-Source: AGHT+IFw0NwFijMYNMW9kuTFt7bRVkLtNGv4jeDQ5jkUJ852sXkmGnAkaL9AbRCful56bmXbC5avUg==
X-Received: by 2002:a0c:e851:0:b0:67e:f034:d540 with SMTP id
 l17-20020a0ce851000000b0067ef034d540mr5729445qvo.84.1702673473347; 
 Fri, 15 Dec 2023 12:51:13 -0800 (PST)
Received: from [192.168.1.201] (pool-108-48-157-169.washdc.fios.verizon.net.
 [108.48.157.169]) by smtp.gmail.com with ESMTPSA id
 u3-20020a0cf883000000b0067eec0ef4b7sm2225716qvn.66.2023.12.15.12.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Dec 2023 12:51:12 -0800 (PST)
Message-ID: <eea5dfe6-ca73-adb9-3f46-fe4ef0d8b64b@gmail.com>
Date: Fri, 15 Dec 2023 15:51:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Igor Prusov <ivprusov@sberdevices.ru>, u-boot@lists.denx.de,
 Michal Simek <michal.simek@amd.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stefan Roese <sr@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20231109105516.24892-1-ivprusov@sberdevices.ru>
 <20231109105516.24892-6-ivprusov@sberdevices.ru>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20231109105516.24892-6-ivprusov@sberdevices.ru>
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 uboot-stm32@st-md-mailman.stormreply.com, Joel Stanley <joel@jms.id.au>,
 kernel@sberdevices.ru, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v7 5/8] clk: Add dump operation to clk_ops
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

On 11/9/23 05:55, Igor Prusov wrote:
> This adds dump function to struct clk_ops which should replace
> soc_clk_dump. It allows clock drivers to provide custom dump
> implementation without overriding generic CCF dump function.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Sean Anderson <seanga2@gmail.com>
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> ---
>   include/clk-uclass.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/include/clk-uclass.h b/include/clk-uclass.h
> index a22f1a5d84..f10dd213ff 100644
> --- a/include/clk-uclass.h
> +++ b/include/clk-uclass.h
> @@ -25,6 +25,7 @@ struct ofnode_phandle_args;
>    * @set_parent: Set current clock parent
>    * @enable: Enable a clock.
>    * @disable: Disable a clock.
> + * @dump: Print clock information.
>    *
>    * The individual methods are described more fully below.
>    */
> @@ -39,6 +40,9 @@ struct clk_ops {
>   	int (*set_parent)(struct clk *clk, struct clk *parent);
>   	int (*enable)(struct clk *clk);
>   	int (*disable)(struct clk *clk);
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	void (*dump)(struct udevice *dev);
> +#endif
>   };
>   
>   #if 0 /* For documentation only */
> @@ -135,6 +139,15 @@ int enable(struct clk *clk);
>    * Return: zero on success, or -ve error code.
>    */
>   int disable(struct clk *clk);
> +
> +/**
> + * dump() - Print clock information.
> + * @clk:	The clock device to dump.

The correct member here is @dev. I fixed this when applying.

--Sean

> + * If present, this function is called by "clk dump" command for each
> + * bound device.
> + */
> +void dump(struct udevice *dev);
>   #endif
>   
>   #endif

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
