Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7372D7DE513
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Nov 2023 18:11:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B57DC6B44D;
	Wed,  1 Nov 2023 17:11:35 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D510C6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Nov 2023 17:11:34 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-778a108ae49so94474785a.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Nov 2023 10:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698858693; x=1699463493;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=46h/KhN/7RdInOJ3BBu0welC5pqJf6vbaHJ5AuuWfxc=;
 b=FXBVf3PQdf2Nf23KEzk+30PE6IZZS/z7X5zD6tSbnJ0vbxJnFyasZ0SRsXVQPZ33/W
 nuC8LNMo9e5VvDfq9klAuQXbAJ8G+kzEO7KDRygJG1JCNc7Fi4UnZm5K/XUfAHx3eMwT
 Lp0FMeogvoakimrcQeoOPET89EoDYh+hO+wfQvy7FWk9HLsx3xDhDQU+/Xz78Jc2Kn7x
 lPzifMtjn5XUkfl/KyGpV0wnJOhPWYzZPb7t7gRmfkCKlU50jDWhMbckXempwB7/j6K8
 935AAe2LUgzitAnyAWLJFru0bsxDFyxSDWlR6pPteWmoABMsaaehltxC4QTVhG6TTY5I
 SV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698858693; x=1699463493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=46h/KhN/7RdInOJ3BBu0welC5pqJf6vbaHJ5AuuWfxc=;
 b=RQ+VD7rnQ6uJ0Wjx/aHjg1g9kDeu2+2qKW8AI64xPXHT7RVZxTrkymceQ47261D2eA
 9KhzqxEjEbCOsSTdcr1ORkxX4VaNry/9OpJcm5J7IVC5O+dMlL/8oz53py71e3iH0RGV
 lFUE0f8XKy6X5IAmCV5sv2jRiWVJ0jwp6hxwoVp7tpXBoDd5FEWbQkn49kWNHFKNPl0c
 EkxUBhq9e0R9PiGGVSAjvx/OVtS4WXgTe24MinfcYIf+PwezBgnM1WMd7EAhhXyFHBmV
 vAatW4mEi8obZPHQbTYdTMJubz8Vw9RUqh2hHm7s05/E7IvPeImxzfCBNeH/htBtVyJ2
 5RTw==
X-Gm-Message-State: AOJu0YwceEvKAPYfUNBhqTDHrxEJYjuaNGyM0Cgz7SCA9ftqQPSfUSz8
 SGsT9H9/YUgtxGSIuEC69xc=
X-Google-Smtp-Source: AGHT+IEcwjX/wTuzVtFvF9fyx6gqKP6h8lXShoRRIbfXGmfv9FK3wjgzUwWau5AEn1kE3m2qRG5YpA==
X-Received: by 2002:a05:620a:1488:b0:778:8ebc:129e with SMTP id
 w8-20020a05620a148800b007788ebc129emr8351667qkj.15.1698858693336; 
 Wed, 01 Nov 2023 10:11:33 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-48-157-169.washdc.fios.verizon.net.
 [108.48.157.169]) by smtp.gmail.com with ESMTPSA id
 a14-20020a05620a02ee00b0076f21383b6csm1582561qko.112.2023.11.01.10.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 10:11:33 -0700 (PDT)
Message-ID: <df88e98f-99de-abca-de7c-6d755c6283ff@gmail.com>
Date: Wed, 1 Nov 2023 13:11:31 -0400
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
References: <20231017165649.1492-1-ivprusov@sberdevices.ru>
 <20231017165649.1492-6-ivprusov@sberdevices.ru>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20231017165649.1492-6-ivprusov@sberdevices.ru>
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Joel Stanley <joel@jms.id.au>, kernel@sberdevices.ru, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v4 5/8] clk: Add dump operation to clk_ops
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

On 10/17/23 12:56, Igor Prusov wrote:
> This adds dump function to struct clk_ops which should replace
> soc_clk_dump. It allows clock drivers to provide custom dump
> implementation without overriding generic CCF dump function.
> 
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   include/clk-uclass.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/clk-uclass.h b/include/clk-uclass.h
> index a22f1a5d84..30621e4823 100644
> --- a/include/clk-uclass.h
> +++ b/include/clk-uclass.h
> @@ -39,6 +39,9 @@ struct clk_ops {
>   	int (*set_parent)(struct clk *clk, struct clk *parent);
>   	int (*enable)(struct clk *clk);
>   	int (*disable)(struct clk *clk);
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	int (*dump)(struct udevice *dev);
> +#endif
>   };
>   
>   #if 0 /* For documentation only */

Please add documentation.

--Sean
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
