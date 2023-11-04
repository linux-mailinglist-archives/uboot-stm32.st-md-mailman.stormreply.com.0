Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 523847E100B
	for <lists+uboot-stm32@lfdr.de>; Sat,  4 Nov 2023 16:23:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6364C6B457;
	Sat,  4 Nov 2023 15:23:09 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14B11C6B444
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Nov 2023 15:23:08 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-7ba962d534eso1309945241.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 Nov 2023 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699111387; x=1699716187;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m8YsGPoM2nP3Oro4YpLc0li5niugDAB0IrtRvzNgb/Q=;
 b=WFSZnKccRvEgMHv4DnF1PrtpdQN0Y0l+bpCLJPBTvNjMwIM3mTjhqnYJ//kRIfXiV+
 15K8YjlXF8nSJiUWw5kvKnF4PztEqMgjVQHc84d7Dab+svGc2JyC4TrKrxrWqdxqKe6j
 9D9B/GnTn8+niHCmUwklGKJXFC5PM93GbMvN/bYCBzoRFzet8JvQ3fllzyeHwa7Am8lC
 HPVbskGXhaT3/109jgZRvJJphOPOXffwTixlbUu/Gww2s41QIqkj2f6ipO/ZDA5/MtHG
 2Bmz+VQoeFcQrm1uvXsZVisgALia1jodrkodv+YdbsdryixgNnanR63mGBOlpMzueIjK
 UMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699111387; x=1699716187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m8YsGPoM2nP3Oro4YpLc0li5niugDAB0IrtRvzNgb/Q=;
 b=FEhOY5+4Kb0Iu6X35/inl3HMB1FXVuST3Ecbn2iIZfK1LF5r+NalayDQxLoNivoia0
 GOLTF6qopK55TugMuu3C5ltZesALN75BRSxrK+vuX0xhP/OEm7RtwtwGDGi18264RU3n
 vfuRmwSg0i4Tm/lgHNfsCV2iF6TAcjkMXxmAUJGrQaM1GHdhxjKbYAlo/HoEu2iGr97L
 hugMhs5AMhT6sE8OIBjDUh5hViGbFkMX4p0UK7YYDU2T5d4cnvSBiCR2eYDcKt+fkFH2
 69+EjiTXeKHB7/GZ4kwi5OLItTPSjTXiz48v+zH9aVbmTUzCFFFeqKX3KYLRu08W8ShT
 HEGQ==
X-Gm-Message-State: AOJu0Yz6x44Tai4snxbLT4AtdaH37/jf+89n/yArpuXu6f8Z6H7TBMBP
 uGYEsVenNNNtSq6x5SuR9S0=
X-Google-Smtp-Source: AGHT+IGEVwLuE1wJ8IUOFTi16FAk+iRReYA53iw/os78VvzWuJAQ1NnVHT7QaRG98zhRxBN3U5mPag==
X-Received: by 2002:a67:cb91:0:b0:45d:9e46:fb50 with SMTP id
 h17-20020a67cb91000000b0045d9e46fb50mr3001730vsl.10.1699111386575; 
 Sat, 04 Nov 2023 08:23:06 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-48-157-169.washdc.fios.verizon.net.
 [108.48.157.169]) by smtp.gmail.com with ESMTPSA id
 kh6-20020a056214514600b006714f8b5512sm1727582qvb.6.2023.11.04.08.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 08:23:06 -0700 (PDT)
Message-ID: <81a727a6-599d-c5f8-e85b-9f66012d5e74@gmail.com>
Date: Sat, 4 Nov 2023 11:23:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Igor Prusov <ivprusov@sberdevices.ru>, Michal Simek
 <michal.simek@amd.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stefan Roese <sr@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20231102122017.56995-1-ivprusov@sberdevices.ru>
 <20231102122017.56995-7-ivprusov@sberdevices.ru>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20231102122017.56995-7-ivprusov@sberdevices.ru>
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Joel Stanley <joel@jms.id.au>, kernel@sberdevices.ru, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v5 6/8] cmd: clk: Use dump function from
	clk_ops
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

On 11/2/23 08:20, Igor Prusov wrote:
> Add another loop to dump additional info from clock providers that
> implement dump operation.
> 
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   cmd/clk.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/cmd/clk.c b/cmd/clk.c
> index c7c379d7a6..4b9709d3ff 100644
> --- a/cmd/clk.c
> +++ b/cmd/clk.c
> @@ -62,6 +62,7 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
>   int __weak soc_clk_dump(void)
>   {
>   	struct udevice *dev;
> +	const struct clk_ops *ops;
>   
>   	printf(" Rate               Usecnt      Name\n");
>   	printf("------------------------------------------\n");
> @@ -69,6 +70,14 @@ int __weak soc_clk_dump(void)
>   	uclass_foreach_dev_probe(UCLASS_CLK, dev)
>   		show_clks(dev, -1, 0);
>   
> +	uclass_foreach_dev_probe(UCLASS_CLK, dev) {
> +		ops = dev_get_driver_ops(dev);
> +		if (ops && ops->dump) {
> +			printf("\n%s %s:\n", dev->driver->name, dev->name);
> +			ops->dump(dev);
> +		}
> +	}
> +
>   	return 0;
>   }
>   #else

Reviewed-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
