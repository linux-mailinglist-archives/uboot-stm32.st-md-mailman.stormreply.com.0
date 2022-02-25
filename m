Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 179264C3E88
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Feb 2022 07:43:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9A2BC6046C;
	Fri, 25 Feb 2022 06:43:04 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D833DC60461
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Feb 2022 06:43:03 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id t21so3799218qkg.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Feb 2022 22:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HS1aIwExzvMH+LJ0kQAdavBGfyTHICMEJwvsHOUkPPM=;
 b=B1hC96iOGAMJy6QHY7Z8x+KzQasJ1ZR/3keldUrNCNLOoG7lAvmUWqDN87EcXhb8VV
 IDQFrFD4JrsdiePWBvkCr+5F7hRkOXOr/JPfMFmzyVJqM/0t96wpRgtMhpmq3iU9dUg6
 ZUYDfvLL6iftzbZ0Q1XouhVHw6N+t3qMwOrPyot/sEyqD6YrQNDprFWvA0GBYxhrDPF5
 fPHQNKASoVPf6QTaPpkD9WSbqpFo4cmS9V/kqc0JgchqMWjKwR6dF7eQTROT7pGPSjLk
 yZAV1byje2mqvaOUOWBLr8d8U6cFgIsGzPvX0IZ6SMmKVDMHhLaf22NQcebPVKDgEow6
 IPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HS1aIwExzvMH+LJ0kQAdavBGfyTHICMEJwvsHOUkPPM=;
 b=WgEwwQhqjT33/vvU+gl1nhEsNX1K5aAU9NHNeGmhXqlAgAC0Mb9Lf3R1wQXUlzBPnL
 7mw9XW+NAmZQfaS16LnmeIj7H1ZzO+XEkxV+THoDrWeTL2268EHTTqaHzFYGoUZ39uoD
 Qp0gxUHrzwDTz5ePSY8TnBDc5se60C9jg1gUT9x+H1+dYri8JY2zQ4t8nB8AXn0ro4lm
 ez1zul/eiKJ18/bb10F78CqMC6uhWr8gEnoutdODj9qNO62Q5eSx3oSygMzGKscj00g9
 mi8oSTCFJ2+y7glXiHy1DoZ644vy5EnC1JVSpCzMbv4Mea7yfOZqPKzRJ8SDow1nDPsn
 8gTQ==
X-Gm-Message-State: AOAM531gDLkqOrp9V9eyZvSP1sEo21k862Nxf4wC3m/YTdeiG+7xJEmT
 h02pfkja7LVZjWVcoZjGHBE=
X-Google-Smtp-Source: ABdhPJyO/PsKD0Bx/ugVaLqyHkrC0chCy2KXCrDl9bB0YINx9BRwINsUG/KYx6DfxOU87rxWcUdeDA==
X-Received: by 2002:a37:ba07:0:b0:47e:15a4:231a with SMTP id
 k7-20020a37ba07000000b0047e15a4231amr3919625qkf.472.1645771382906; 
 Thu, 24 Feb 2022 22:43:02 -0800 (PST)
Received: from godwin.fios-router.home
 (pool-108-18-137-133.washdc.fios.verizon.net. [108.18.137.133])
 by smtp.gmail.com with ESMTPSA id
 i128-20020a378686000000b00648ddd8a5c0sm830238qkd.100.2022.02.24.22.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 22:43:02 -0800 (PST)
From: Sean Anderson <seanga2@gmail.com>
To: u-boot@lists.denx.de,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
Date: Fri, 25 Feb 2022 01:42:16 -0500
Message-Id: <164577131656.1465089.13583613835672823007.b4-ty@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124141711.1.Ic9cd1563aac729132cadae8c5df372be1a49ecc7@changeid>
References: <20220124141711.1.Ic9cd1563aac729132cadae8c5df372be1a49ecc7@changeid>
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] clk: ccf: correct the test on the parent
	uclass in clk_enable/clk_disable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, 24 Jan 2022 14:17:14 +0100, Patrick Delaunay wrote:
> It is safe to check if the uclass id on the device is UCLASS_CLK
> before to call the clk_ functions, but today this comparison is
> not done on the device used in API: clkp->dev->parent
> but on the device himself: clkp->dev.
> 
> This patch corrects this behavior and tests if the parent device
> is a clock device before to call the clock API, clk_enable or
> clk_disable, on this device.
> 
> [...]

Applied, thanks!

[1/1] clk: ccf: correct the test on the parent uclass in clk_enable/clk_disable
      commit: b0cdd8287add19d1af6668b6e9e968046506c08d

Best regards,
-- 
Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
