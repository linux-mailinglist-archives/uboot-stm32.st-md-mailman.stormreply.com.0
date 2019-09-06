Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D31DABF79
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Sep 2019 20:37:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7631EC36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Sep 2019 18:37:36 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA6C9C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2019 18:37:34 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h144so14905825iof.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2019 11:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZXeGTIIV9V0rNvx3qyitrfQavfG+S5ky0ImMHaJCQtA=;
 b=pIVEYRHFnIqXWIaKLBMGLy07uLJ//oOP8yPIN/IyUmemo+TyspTS69mtvIzuSmPVfS
 biya5j6AvCO57n/XqYhjMC8WRiIAVGDpQrMiswx+yZXOkSg3N3+jx0rO6wbyIhAlsSnO
 /8tyrGaQOgMn2lzXy3eRthQegHuzcB4XjiOas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZXeGTIIV9V0rNvx3qyitrfQavfG+S5ky0ImMHaJCQtA=;
 b=rYVajgq2MTvBx86bTNsY2ahgGE66sbXA++Jh/IimlFr2VVyajyME5El87EKhe3uvu6
 95krT5oH44A+daQzI9vjGSBZvcR88H2ZwTOMPvmr/BUopkaz86a0adSemuk9Kb4mxuMv
 EVEN7iF8KsNg6/+LBN2pFOXbOeLaKbVFI5moAa8zM0/R8jHRBxB9M7B2Pg6koHsyjtow
 7VJ+bz+wasmqajpL2oUttVaO+DJtmj1VMce/ER5uEUxZXDTsVNTa+3N2BElIIr6Xisri
 0YCPIyJ6wxl2Oe/z8/6txUfges+OmdR+NDlNHo0Z+I79OHual/3cVEab7oK7bB0NZdWO
 6z+w==
X-Gm-Message-State: APjAAAUPL6BX74RF8yHdl745IMCDuvpw2ztgP+iyAZZghGCprkzqWaU+
 wOddN/18S90dxXuCPyaFvUtAe7j+a4fKmGH1P4GnOQ==
X-Google-Smtp-Source: APXvYqw04VmDlPB1tlhE3reHiRvvD4zFgDPCmJtuA8PX4O7iopuIYK8cvpCoxAeMQrV1Zedj1EWB7jupYGNZLOVfNhU=
X-Received: by 2002:a5d:9b06:: with SMTP id y6mr11984664ion.77.1567795053449; 
 Fri, 06 Sep 2019 11:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190802134629.12749-1-patrice.chotard@st.com>
In-Reply-To: <20190802134629.12749-1-patrice.chotard@st.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 7 Sep 2019 00:07:22 +0530
Message-ID: <CAMty3ZBRvSSiuFjDF-So=o54Hy5dpj-h1fs2ucrBzMgKDs0szQ@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot-Denx <u-boot@lists.denx.de>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] spi: soft_spi: Fix data abort if slave is
	not probed
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

On Fri, Aug 2, 2019 at 7:16 PM Patrice Chotard <patrice.chotard@st.com> wrote:
>
> From: Christophe Kerello <christophe.kerello@st.com>
>
> In case spi_get_bus_and_cs callback is used, spi bus is first probed
> then slave devices are probed. To avoid a data abort in soft_spi probe
> function, we need to check that (slave != NULL).
>
> If slave is NULL, cs_flags and clk_flags will be initialized with
> respectively GPIOD_ACTIVE_LOW and 0.
>
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---

Applied to u-boot-spi/master
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
