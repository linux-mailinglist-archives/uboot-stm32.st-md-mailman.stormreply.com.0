Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 790ED7DE512
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Nov 2023 18:11:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26325C6B44D;
	Wed,  1 Nov 2023 17:11:01 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DC88C6A5F2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Nov 2023 17:10:59 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-7b9d894be6fso2137547241.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Nov 2023 10:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698858658; x=1699463458;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b/DVyx7HV1QtHnJQKbe6LRy4VncbddBPWfDdtcBheIM=;
 b=ZbQ1a4THyTU8FAPHn368bRpt066WNXNhzmCn0ltLS+0GyjzvV1LRO/1d0UjkCOZpqG
 c0/oG0X5CYYrS4SKFTw6fkbd3pXNqXD44XjvPiraoyq8zNkEUtDHLduFl9RAFw7f5LC9
 19XgnJ+bZolV5L1vKlYibCrSD1WNz+NX68kyE8+/F7ddePFYGAeyqcSR5eQ16+2cbMdp
 pJlWyUd84OCeH1g7FoMau9HS168Wp0QzysdCOypqL5uO8rsaIJGdGPitG1j0Tty/cSyj
 yFrp52a4N9y1dM1wZXLI2+AjXMgJQGZIGfec95Ptsq8w2lD946GGn4KR4y7Ct+uDv0p1
 e0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698858658; x=1699463458;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b/DVyx7HV1QtHnJQKbe6LRy4VncbddBPWfDdtcBheIM=;
 b=go1kCNAX7ZGC5wf+vbB12dJtpkOwneEXybtJcZdBDexa5pTc3dPZbeppS3ItvrCX3s
 Fxs7fWTi8ZdoWpSELn/hMR/G8Bzyax2byYKEO++YKlllWm9hsttbqeYAPDXelZW86Ne6
 C8zW8buYr/9GsU+GpYD6dej/FxQ/IQ3T4GujX2fmtNA/aUHt0gLIr1fdZ6C+g3KsYCzN
 ypj6gp4eKTT37bkkeOBxAJG68NSto3NcAdrUV7afGjjIZRQOJyDWkRx+gb8C7P48HU1c
 VqbusrvWXrAaMttuiZuQBUQZkdSzZZSEvKRDmPUIyolvBu/W8I1jE+UaxoFOAvrO2kpj
 s53g==
X-Gm-Message-State: AOJu0YxHHzt1UjFYb8DFdDMYeQfbK5kp2Yewvrn6Zf3zBy7RVGS4+wdF
 /9aH2q0XtYF5Lx0Gx/mdBKg=
X-Google-Smtp-Source: AGHT+IFlvUnuSsp0RjozNueg7ItSkpx0jpzbbVQ2lc6wIYn+7vbHuSRFiC1NogWAWIAxfT7fDQYCEg==
X-Received: by 2002:a67:c896:0:b0:458:3bc1:c816 with SMTP id
 v22-20020a67c896000000b004583bc1c816mr11460758vsk.16.1698858658174; 
 Wed, 01 Nov 2023 10:10:58 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-48-157-169.washdc.fios.verizon.net.
 [108.48.157.169]) by smtp.gmail.com with ESMTPSA id
 de43-20020a05620a372b00b007788d2f3d4asm1592402qkb.39.2023.11.01.10.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 10:10:57 -0700 (PDT)
Message-ID: <c1c4205c-edb0-7dd2-3ff0-3be1c6a79104@gmail.com>
Date: Wed, 1 Nov 2023 13:10:56 -0400
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
 <20231017165649.1492-7-ivprusov@sberdevices.ru>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20231017165649.1492-7-ivprusov@sberdevices.ru>
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Joel Stanley <joel@jms.id.au>, kernel@sberdevices.ru, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v4 6/8] cmd: clk: Use dump function from
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

On 10/17/23 12:56, Igor Prusov wrote:
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
> index c7c379d7a6..90cc6fa906 100644
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
> +			printf("--------------------------\n");
> +			ops->dump(dev);
> +		}
> +	}
> +
>   	return 0;
>   }
>   #else

So this produces output like

=> clk dump
  Rate               Usecnt      Name
------------------------------------------
  26000000             0        |-- osc
--------------------------
  Rate      Enabled Name
------------------------
  26000000  y       osc
  780000000 y           pll0
  390000000 -               aclk
  390000000 y                   cpu
  390000000 y                   sram0
  390000000 y                   sram1
  7800000   -                   clint
  195000000 y                   apb0
  195000000 y                       gpio
  195000000 y                       uart1
  195000000 y                       uart2
  195000000 y                       uart3
  195000000 y                       fpioa
  195000000 y                       sha
  195000000 y                   apb1
  195000000 y                       aes
  195000000 y                       otp
  195000000 y                   apb2
  195000000 y                   rom
  390000000 y                   dma
  390000000 y                   dvp
  390000000 y                   fft
  390000000 y               spi0
  390000000 y               spi1
  390000000 y               spi2
  97500000  y               spi3
  390000000 y               i2c0
  390000000 y               i2c1
  390000000 y               i2c2
  390000000 y               timer0
  390000000 y               timer1
  390000000 y               timer2
  390000000 y           pll1
  390000000 y               ai
  0         n           pll2
  0         y               i2s0
  0         y               i2s1
  0         y               i2s2
  0         -               i2s0_m
  0         -               i2s1_m
  0         -               i2s2_m
  13000000  y           wdt0
  13000000  n           wdt1
  26000000  n           rtc

And TBH I don't think it's particularly clear (at least at a glance) where
one clock ends and another begins. I think something like

diff --git i/cmd/clk.c w/cmd/clk.c
index f55911db7a3..7bbcbfeda33 100644
--- i/cmd/clk.c
+++ w/cmd/clk.c
@@ -73,7 +73,7 @@ static int soc_clk_dump(void)
         uclass_foreach_dev_probe(UCLASS_CLK, dev) {
                 ops = dev_get_driver_ops(dev);
                 if (ops && ops->dump) {
-                       printf("--------------------------\n");
+                       printf("\n%s %s:\n", dev->driver->name, dev->name);
                         ops->dump(dev);
                 }
         }

would work a lot better. This produces an output like

=> clk dump
  Rate               Usecnt      Name
------------------------------------------
  26000000             0        |-- osc

k210_clk clock-controller:
  Rate      Enabled Name
------------------------
  26000000  y       osc
  780000000 y           pll0
  390000000 -               aclk
  390000000 y                   cpu
  390000000 y                   sram0
  390000000 y                   sram1
</snip>

which I think makes it clearer that we have a new clock tree getting dumped.

This also doesn't really address multiple interacting clock trees (such as
e.g. if I had another clock derived from a k210_clk in the above example)
but at least it's a start.

--Sean
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
