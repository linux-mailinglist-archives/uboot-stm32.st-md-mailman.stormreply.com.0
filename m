Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6485A7E10A1
	for <lists+uboot-stm32@lfdr.de>; Sat,  4 Nov 2023 19:40:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 109CEC6B457;
	Sat,  4 Nov 2023 18:40:38 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BA95C6B44D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Nov 2023 18:40:37 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-66d264e67d8so19389526d6.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 Nov 2023 11:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699123236; x=1699728036;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ja/FE5wN+tTL4Kr54S+UUTq69lbgK/uClyCwJTa5hF4=;
 b=ideBDro/ZSjvZVWm7HfTmIWSSmNqQmfmA8m+7zEuAikbiWve9I96WoFXbPU8K+v3vO
 QXRIDwndGR1cRXH6kLGwqjRCDIXwk+2CByomcPryGIg6O6xoDXodoXfMEEltXwFEibYN
 MFWMKJ2A+pe6b3Nnzon/TCy+Vs4WTOsu1b3M6sxS7AFZl6WByr5HpPsxqGxlHauvNqx8
 Kahj3jEqyjfpFY9U+cXtpSxcP+gfUPVopRlLaUfMZxUduFZFg2heFOr6ZS9IHzmpUzwU
 e4+eA9YDv4BMRe7JGJbo+6FC7Wuo/6feDoyXX94stBXkWETEHJQTClc7QyxGq2WZym58
 fYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699123236; x=1699728036;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ja/FE5wN+tTL4Kr54S+UUTq69lbgK/uClyCwJTa5hF4=;
 b=tuivZY2spl/qtIp2i/uUp4AnRpj/bU2l1uXx8CPBc3WWb+8Rrl1yFG8wznUAcanmrI
 TmGCFgQD9YOu/gmGT1VfT13ZZUa/fbnr9cF7ZKYo0xtlkHH40XjmnQt1BswZr7tFKj4X
 VTEhncD78biq/A3YTw8aOLiA6DN36Ig88jElOIIkhr2u64mB2fkw1L9AD6/eqRqv0KrF
 688mN8SxTjp0/8sQ2BurpkJzTCPS6EmFl53qSZToH02nk14XMwMZQpjbLHuFNnPDT2Z8
 gcai5mYvnoZQG46d3GLT1hbRO58w/eINTApb07I1Wf1Hrw3039A6wRbS76a3V2U30WqZ
 QWcg==
X-Gm-Message-State: AOJu0Ywt0esjqK/fpVDXo7jCNS8CB87t6r6hfmR4wbf0kSruvGAGzX4A
 HG1OvoCH8xUkmIpVTmlY/4E=
X-Google-Smtp-Source: AGHT+IFJ4GXr/ZUzlj3TCJF03jyuJoGGJdQcfPZSQd7HT2n5QUjYITLbS854SHftoIr5Gy7SO23OTg==
X-Received: by 2002:a05:6214:c2c:b0:672:e2d5:7a7f with SMTP id
 a12-20020a0562140c2c00b00672e2d57a7fmr18346059qvd.29.1699123235999; 
 Sat, 04 Nov 2023 11:40:35 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-48-157-169.washdc.fios.verizon.net.
 [108.48.157.169]) by smtp.gmail.com with ESMTPSA id
 x1-20020ad44581000000b00647386a3234sm1845865qvu.85.2023.11.04.11.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 11:40:35 -0700 (PDT)
Message-ID: <d6968ccd-9bd9-56d9-030c-52892d137c07@gmail.com>
Date: Sat, 4 Nov 2023 14:40:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Igor Prusov <ivprusov@salutedevices.com>
References: <20231102122017.56995-1-ivprusov@sberdevices.ru>
 <20231102122017.56995-6-ivprusov@sberdevices.ru>
 <712d1810-93ad-8fd5-8989-1274b5ce49ce@gmail.com>
 <20231104180920.ubq4odp454n4wo52@pc>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20231104180920.ubq4odp454n4wo52@pc>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot@lists.denx.de,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, prusovigor@gmail.com,
 Lukasz Majewski <lukma@denx.de>, Igor Prusov <ivprusov@sberdevices.ru>,
 kernel@sberdevices.ru, uboot-stm32@st-md-mailman.stormreply.com,
 Joel Stanley <joel@jms.id.au>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Stefan Roese <sr@denx.de>, Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH v5 5/8] clk: Add dump operation to clk_ops
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

On 11/4/23 14:09, Igor Prusov wrote:
> On Sat, Nov 04, 2023 at 11:24:32AM -0400, Sean Anderson wrote:
>> On 11/2/23 08:20, Igor Prusov wrote:
>>> This adds dump function to struct clk_ops which should replace
>>> soc_clk_dump. It allows clock drivers to provide custom dump
>>> implementation without overriding generic CCF dump function.
>>>
>>> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
>>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>> Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>> ---
>>>    include/clk-uclass.h | 15 +++++++++++++++
>>>    1 file changed, 15 insertions(+)
>>>
>>> diff --git a/include/clk-uclass.h b/include/clk-uclass.h
>>> index a22f1a5d84..793bf14160 100644
>>> --- a/include/clk-uclass.h
>>> +++ b/include/clk-uclass.h
>>> @@ -25,6 +25,7 @@ struct ofnode_phandle_args;
>>>     * @set_parent: Set current clock parent
>>>     * @enable: Enable a clock.
>>>     * @disable: Disable a clock.
>>> + * @dump: Print clock information.
>>>     *
>>>     * The individual methods are described more fully below.
>>>     */
>>> @@ -39,6 +40,9 @@ struct clk_ops {
>>>    	int (*set_parent)(struct clk *clk, struct clk *parent);
>>>    	int (*enable)(struct clk *clk);
>>>    	int (*disable)(struct clk *clk);
>>> +#if IS_ENABLED(CONFIG_CMD_CLK)
>>> +	int (*dump)(struct udevice *dev);
>>> +#endif
>>>    };
>>>    #if 0 /* For documentation only */
>>> @@ -135,6 +139,17 @@ int enable(struct clk *clk);
>>>     * Return: zero on success, or -ve error code.
>>>     */
>>>    int disable(struct clk *clk);
>>> +
>>> +/**
>>> + * dump() - Print clock information.
>>> + * @clk:	The clock device to dump.
>>> + *
>>> + * If present, this function is called by "clk dump" command for each
>>> + * bound device.
>>> + *
>>> + * Return: zero on success, or -ve error code.
>>> + */
>>> +int dump(struct udevice *dev);
>>
>> Actually, this should return void, since we don't do anything with the return code.
> Good catch! Though there is, for example, zynqmp_clk_dump() that may
> return an error code. Wouldn't it be better to print an error message
> with the code in soc_clk_dump()? It might be convinient to have common
> code handling unexpected errors during dump.

Since this function is for printing, if the driver gets an error
it should just print the error itself. It can probably provide a better
error message than we can. And this command is mainly informational anyway,
so we don't really need to set the return code (e.g. $?).

--Sean

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
