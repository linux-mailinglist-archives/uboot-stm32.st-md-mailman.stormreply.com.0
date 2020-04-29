Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB7E1BE5CE
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 20:04:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 769D0C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 18:04:51 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C53FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 18:04:50 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id s202so2655364oih.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 11:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RfNiKoq4J0KenDqZVAFhfRyrrUdYl2qROY3gm/BEQZs=;
 b=kBeHGu1uW/fQOkz8BfsZ8zaL6bhBDTVv/jg5F7bR6Q3v/KCXJWr6qCxecljNLS4ggS
 8Y4l0pqjQaegPmp9HkiAnDbDzCmsNqq1D9WA9EhR46U9jjCI+cgYg9zRHuMZpB+Mviu5
 ySBuJkx9zMHyd3dgu+S2ATLr9otgiUyz28rtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RfNiKoq4J0KenDqZVAFhfRyrrUdYl2qROY3gm/BEQZs=;
 b=kYRNW+SYhLHtHdBMogtXdlxugANEKHqS0qr99bwqlr9WPikVX3XMeqs2LwbS0ARZVK
 q/4/K+gyZGaDz2yA3005mK1NLyqvEac+NNhRwSTY1fv7I6dj0XAd5zEapkCjkKsxJb+n
 YIdJBWzvQqXLofpS0jN9NQsdQ+bl7TQkKBnpUY0DrX6yKG97sGH31ePeel1vxmtqkD3T
 j4FulgfEeEjJLnRUAMKh8c3aie3Br/jMTS1y6t6mXyDpTVizzZIUMN8zqmUVBx7zbckK
 D/8YvhLLCG9Fx5cUrwmhthbCgG3RBowSZMg1Lxju0voZP12oRNyJxgaw7dLCEqz6AaSu
 Xa2g==
X-Gm-Message-State: AGi0PubDdCvUSFow+6xPhLKY3IMl4Z0tg+d80iMt7uzhGd8QcBwVRJTW
 Gp+krK1hdUpt22ZlOWic9g1cATGydZiQC0SAB4XqCg==
X-Google-Smtp-Source: APiQypL6MU+f92aR24dr1vkGGphUORUdGMiUEcmmPVN/wTcapjC/TShQgs5oY/SPxZ7gDS5o9igvOmVmCtM0ztDpXHE=
X-Received: by 2002:a05:6808:905:: with SMTP id
 w5mr2593233oih.97.1588183488861; 
 Wed, 29 Apr 2020 11:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200429122031.31279-1-patrice.chotard@st.com>
 <20200429122031.31279-6-patrice.chotard@st.com>
In-Reply-To: <20200429122031.31279-6-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Apr 2020 12:04:33 -0600
Message-ID: <CAPnjgZ3sioJvPoz0BPZ1tQzhNvzdusiHmDP8v=fxmpH25Q2mXw@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Andre Przywara <andre.przywara@arm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 5/5] doc: add bind/unbind command
	documentation
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

Hi Patrice,

On Wed, 29 Apr 2020 at 06:20, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> Add documentation in doc/drivel-model for the bind/unbind command.
> Part of this documentation is extracted from original patch commit
> message:
> commit 49c752c93a78 ("cmd: Add bind/unbind commands to bind a device to a driver from the command line")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
> Changes in v2: None
>
>  doc/driver-model/bind.rst  | 32 ++++++++++++++++++++++++++++++++
>  doc/driver-model/index.rst |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 doc/driver-model/bind.rst
>
> diff --git a/doc/driver-model/bind.rst b/doc/driver-model/bind.rst
> new file mode 100644
> index 0000000000..df6b5f143b
> --- /dev/null
> +++ b/doc/driver-model/bind.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +.. sectionauthor:: Patrice Chotard <patrice.chotard@st.com>
> +
> +Binding/unbiding a driver

unbinding

> +=========================
> +
> +This documents aims to describe the bind and unbind commands.

document

> +
> +For debug purpose, it should be useful to bind or unbind a driver from

For debugging

> +the U-boot command line.
> +
> +The unbind command calls the remove device driver callback and unbind the
> +device from its driver.
> +
> +The bind command binds a device to its driver.
> +
> +In some cases it can be useful to be able to bind a device to a driver from
> +the command line.
> +The obvious example is for versatile devices such as USB gadget.
> +Another use case is when the devices are not yet ready at startup and
> +require some setup before the drivers are bound (ex: FPGA which bitsream is
> +fetched from a mass storage or ethernet)
> +
> +usage example:
> +
> +bind usb_dev_generic 0 usb_ether
> +unbind usb_dev_generic 0 usb_ether

can you mention what the two parameters are and how to find them?

> +or
> +unbind eth 1
> +
> +bind /ocp/omap_dwc3@48380000/usb@48390000 usb_ether
> +unbind /ocp/omap_dwc3@48380000/usb@48390000
> diff --git a/doc/driver-model/index.rst b/doc/driver-model/index.rst
> index b9df221627..37ef3721df 100644
> --- a/doc/driver-model/index.rst
> +++ b/doc/driver-model/index.rst
> @@ -6,6 +6,7 @@ Driver Model
>  .. toctree::
>     :maxdepth: 2
>
> +   bind
>     debugging
>     design
>     ethernet
> --
> 2.17.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
