Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 952A68B43B
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Aug 2019 11:34:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63D80C35E01
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Aug 2019 09:34:40 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67D00C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 09:34:39 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id k18so37880265otr.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 02:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2IA6Eh8a71xdMgVEHGJivTI3M041NaMKwcS5Qu8Exkk=;
 b=LV/l5M5H+uhO912I/TYGdBLFiqhL1yFTD6bqGCNdIEsQj+QBNTRirOhG0/Gp30m6Gr
 wy0xh3p3nNR7Duulv5f1iI0KXEvyWEnrKlFJS4YzzCR9AcJD4sG2Db7hk3lZ4vzfx4vy
 xf2+2Kam14lHlWan9tZFqrrjLdufjCcEhVTgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2IA6Eh8a71xdMgVEHGJivTI3M041NaMKwcS5Qu8Exkk=;
 b=Q6AJTg/oJIdiCz9EUEaVc6ZLhGgX0IcI0SqHcgP8zdbQ1/MR2xgWT6T6CzTGoOqz1I
 qKUyh7TxJZ9V8VLd8v3Y91aXRwk0IpI7aEQARu3T6EnErn16ucVG650CsbasFZ+l+JOW
 kz1cXzL0G7jWJJ1kOnqoVEEQB6BQiWiLW4L9SmJ70R4h8R9SHbA683GjTdxX0jq1bhcj
 iXy7fM8EzszYNjmqO3Ow3osElRs6mnoKp9b6K3ycXWRGu7IBEPngYtMbbTmjwv3hJCCI
 pm1ju1bgcYxOOHGmBg46x0LS38cEVh2X3KE/zdswYHrTvQyNo/n8ukVkZlgVgwvCHciJ
 UHBg==
X-Gm-Message-State: APjAAAU0XckZmaWynhlsJnEMLXsjSfwW5H/1mJjFtoMiwkZXcxhcajGe
 +NUp6UCNPbp4Zqn0GvrhIFhE7zwo50isJuA+G6zwuQ==
X-Google-Smtp-Source: APXvYqysmwu7PXGwxeZTVwEhwSUXsmmsbEUAAVetY0QtJrbApzGtPa5bInL5QhHkEXCcHQDuVw2qp8EPgXKeC68YyHc=
X-Received: by 2002:a05:6830:1249:: with SMTP id
 s9mr35138696otp.33.1565688877722; 
 Tue, 13 Aug 2019 02:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <1564750081-31319-1-git-send-email-patrick.delaunay@st.com>
 <1564750081-31319-2-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1564750081-31319-2-git-send-email-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 13 Aug 2019 03:34:21 -0600
Message-ID: <CAPnjgZ13q4orq=Yp6r=LzT-uahzaQTF7fcuzdGDGLwrLF76abw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrice Chotard <patrice.chotard@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Ryder Lee <ryder.lee@mediatek.com>,
 David Wu <david.wu@rock-chips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Chris Packham <judge.packham@gmail.com>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH 2/2] dm: pinctrl: introduce
	PINCONF_RECURSIVE option
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

On Fri, 2 Aug 2019 at 06:48, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> In the Linux pinctrl binding, the pin configuration nodes don't need to
> be direct children of the pin controller device (may be grandchildren for
> example). This behavior is managed with the pinconfig u-class which
> recursively bind all the sub-node of the pin controller.
>
> But for some binding (when pin configuration is only children of pin
> controller) that is not necessary. U-Boot can save memory and reduce
> the number of pinconf instance when this feature is deactivated
> (for arch stm32mp for example for SPL).
>
> This patch allows to control this feature with a new option
> CONFIG_PINCONF_RECURSIVE when it is possible for each individual
> pin controller device.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>

Reviewed-by: Simon Glass <sjg@chromium.org>
> Hi,
>
> Found her a proposal to have a more clear output of "dm tree" command
> and to reduce the memory footprint of PINCTRL_FULL for the arch stm32mp1
> (bdinfo "Early malloc usage" is reduced from 2588 to 2144).

Gosh that is still a lot! But a nice improvement.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
