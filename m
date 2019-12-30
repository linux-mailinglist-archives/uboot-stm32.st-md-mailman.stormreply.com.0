Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF40B12CB95
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 02:21:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77FAFC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 01:21:33 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7578C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Dec 2019 01:21:31 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id h9so41708223otj.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2019 17:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/4J8NlUC1WGmBNNZK087n1YOAh3+VlXCeyMwrlVte6Q=;
 b=KfAj1DoIycJY2nAiQb58+wqy54ZN+llQJCrCYgZHS7ksmYaOOQfLA/R+rD9zbkLWkG
 +6/bdCSmZ+4BxVQORlP8rVDlxFel7yoqY4Bl0Z73Hqdd4c9daMYEbL1CLgqy9SzoB5st
 S8+Dt355O/U3aatpo6bgq6lzuByzRzXBsMNh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/4J8NlUC1WGmBNNZK087n1YOAh3+VlXCeyMwrlVte6Q=;
 b=dQNcMWqrp4x9nzizPtlWKFNLkt1hf1ebanMJHeGLb2qucWMXSbQ5Oo94kP8ufxLah2
 j5edMcYlDEZpAfpZbPurKXf8TlbDpXmG3VCScdP+9l02NnhCd4MJtQg6RYNtlK9I0LwY
 Chkh+ccL7ZyvxBpJp3Z6HBNpP2qMukJKg3KyZL6jvIznM6WyVsCs/iafkFgN+P0D8dgU
 zw88o/WpHxotzy0G7itZkCFgW357LuDBAqUVqPm1gfTEPDhFb1NEZC6REGQlMv8nhdNc
 XajirmqbcWo6NSLo2UQJwwxkeagA7S0jzY8/v5g+UOafbU0dKLEu8K8Blct9Tmsiyoc0
 a0iA==
X-Gm-Message-State: APjAAAX+Mdf2tq/mt7a+tBN6SwCbEX5tUNe64rUhsXxonLLc0bzt8Wr3
 WTO3EI5NiDQ4mB1VBguLwaDgs4QTg+66jrgw1IqRY/gz
X-Google-Smtp-Source: APXvYqxTbh7H6ATuO7yfAAlQAa3mBMbRz0ktV+vdOVpRPww2uzgDzw/EcTV2DqD/oi926WzAR7pJfi2f9q5DQQ+UlYs=
X-Received: by 2002:a9d:2dca:: with SMTP id g68mr65899584otb.150.1577668890339; 
 Sun, 29 Dec 2019 17:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20191126084911.19761-1-patrick.delaunay@st.com>
 <20191126084911.19761-14-patrick.delaunay@st.com>
In-Reply-To: <20191126084911.19761-14-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 29 Dec 2019 18:21:17 -0700
Message-ID: <CAPnjgZ1S0RVEQzK3YTNDipcWwM7b-q4+hCTweq9HD7P5epEReA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Alex Marginean <alexandru.marginean@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 13/14] test: dm: update test for pins
	configuration in gpio
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

On Tue, 26 Nov 2019 at 01:49, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add tests for new API set_dir_flags and set_dir_flags and associated
> code in gpio uclass.
>
> Test support for new flags GPIO_OPEN_DRAIN, GPIO_OPEN_SOURCE
> GPIO_PULL_UP and GPIO_PULL_DOWN.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - simplify sandbox GPIO driver: save dir_flags (GPIOD_...)
>   and remove internal flags (GPIOF_...); the previous path
>   "gpio: sandbox: cleanup flag support" is no more needed
> - add unitary test in dm_test_gpio for set_dir_flags
> - add some function check in dm_test_gpio_phandles
> - dm_test_gpio_pin_config change to dm_test_gpio_get_dir_flags
>
>  arch/sandbox/dts/test.dts       | 16 ++++++
>  arch/sandbox/include/asm/gpio.h | 20 ++++++++
>  drivers/gpio/sandbox.c          | 86 +++++++++++++++++++++++++--------
>  test/dm/gpio.c                  | 66 ++++++++++++++++++++++---
>  test/dm/test-fdt.c              |  2 +-
>  5 files changed, 163 insertions(+), 27 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
