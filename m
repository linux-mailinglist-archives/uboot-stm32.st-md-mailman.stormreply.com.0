Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D68FE7E5BD5
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Nov 2023 17:59:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B08DC6B44D;
	Wed,  8 Nov 2023 16:59:32 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6029C6B444
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Nov 2023 16:59:30 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-77897c4ac1fso450184585a.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Nov 2023 08:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699462769; x=1700067569;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cMmYg75P5dlUq1+l87xMHYcn2m6Zjceco9n88HPllCE=;
 b=aNI2UlWhq5HK+hmO2C05N4gPvRPxVTCvuXqaVh49C3IP90G/cABTdpbHR6OM/fXhF1
 wxCdDzkHPHlfrbfxbyTK9gatlcvswhLQsotREue44Mr0XKSAUc7/WFNQLrTEtP2lzf4t
 f4iKxjyA52dsGohR2v2+Qo/Uh7geXPn3J3ny7sCThglgySeqLEL0ASrOPHbxh2y9k2Pq
 HpEi5XROHg+FQR6xl86EIN6MvQhyYfbiZGH8616/MNcvyw9ZejFfvnEeS5Flj+w/eh2j
 8hvILaXCSLAQd7ZlnPZ0AFAtDfS6PlXo+y/5ybUfo0LKf+7qsjYCiLWBjlkQKN41aHsr
 d00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699462769; x=1700067569;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cMmYg75P5dlUq1+l87xMHYcn2m6Zjceco9n88HPllCE=;
 b=JhgoxOF5VVDQCJbLV8gSkaDSoFiPYsXSUA3lZVkqO0DAdU+d5NM2EUQNhxTrbe8twj
 56ceW9BBjn5UCliMycVyovzkstUBvZdWWs5DKzAPq2hVd6APkmxZ1v8NDaEAzu8w+cJH
 GpaIO10I28U7cJwRHOg1xCL3zzzRGGkhCvfD6vKuxnuwDrCfRXPcKdDIfmlvfANDR7vA
 5JiY/VpdFI0gUVsIpmji6lxBWAWa3PgGE+RuqHNFftcoZ88HGbwIcYKcsPnylOxQxXpz
 8PKL0u/mBnK2u62Z+ScL3U3BqGwx98UbZGczDYuyW6Dj1QtUGhad8eUiRN0HHhts3L48
 8stA==
X-Gm-Message-State: AOJu0YwEvDWL3exvtJQEXPjuXGW8JV59GPMhqxcJJjpSDhIR8rf3JRKy
 gxDeMYhCovj5VXm7v7k3D+A=
X-Google-Smtp-Source: AGHT+IGEmCpG0eYtdQIN4nV9wfwL4Bx0wCLKI0R8JSwGLGqES1vqiXY9WmplMzSKKwk3wLcU1PdQPw==
X-Received: by 2002:a05:620a:2886:b0:775:93aa:cb91 with SMTP id
 j6-20020a05620a288600b0077593aacb91mr2147427qkp.35.1699462769617; 
 Wed, 08 Nov 2023 08:59:29 -0800 (PST)
Received: from [192.168.1.201] (pool-108-48-157-169.washdc.fios.verizon.net.
 [108.48.157.169]) by smtp.gmail.com with ESMTPSA id
 a19-20020a05620a125300b007676f3859fasm1233774qkl.30.2023.11.08.08.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 08:59:29 -0800 (PST)
Message-ID: <0f971f33-79ce-a957-dd7d-e1151364e034@gmail.com>
Date: Wed, 8 Nov 2023 11:59:28 -0500
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
References: <20231105083809.3293-1-ivprusov@sberdevices.ru>
 <20231105083809.3293-7-ivprusov@sberdevices.ru>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20231105083809.3293-7-ivprusov@sberdevices.ru>
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 uboot-stm32@st-md-mailman.stormreply.com, Joel Stanley <joel@jms.id.au>,
 kernel@sberdevices.ru, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v6 6/8] cmd: clk: Use dump function from
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

On 11/5/23 03:38, Igor Prusov wrote:
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
