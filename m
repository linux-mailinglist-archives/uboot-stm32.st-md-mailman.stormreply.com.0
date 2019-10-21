Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2626DF8C4
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2019 01:47:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87BAAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 23:47:20 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EE46C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2019 23:47:19 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id k20so12639586oih.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2019 16:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AD8fzGxqeN8m2Z8MrGDWDu2Bg0uqeUZTKX90G1TuPpo=;
 b=hme+hNFAWKgcY6y/mDQRnL+U96ZjwlLuYRmCkBJC2MFu3uzTbzGVggHj6/uzdR1/0T
 X53jY7d8Ap8k6AMjuY2b9FNKk+hQ2P6gdnFjbWlhIGchmQvJvrNoftZvYRB63s66nv6+
 q6LRhCe/8iSQTdfzrTer0e4PbC5X0eZGTqvW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AD8fzGxqeN8m2Z8MrGDWDu2Bg0uqeUZTKX90G1TuPpo=;
 b=LkAmz1k1neJrWi+uvRvTDwBVtFrfbBWbIA176ZK/StfW+Rv5B+YfjWy1bb/ZzMXctZ
 DB1aDd6ug0qiZIPajUPpdqHyt4JB8IE/zg/TOWIsqsNtu3Ap/J4hNmbJPZUiHkD2aqIl
 Ch5ziPLnCScbIX2BkzjF+mLOl2xsNiNxl8yj4S/me456YsljRMzNsbGLNOvtNTQDBx6w
 Jc0pQla2im8Agc6wl5gHRiTtyk4Bwu/wBlL2+/HShELpUHluw9oQkTnC71TLLtXPEBfW
 vqWw09bbce6qAOT02taofr4BVa8MpObfvb8RTveFld32yO3CM0PhnoJTwFUzrpr4+KKa
 Ri0Q==
X-Gm-Message-State: APjAAAXjOMQjD2jGFIbPsxz/5z2PaaotX8KjPCqnBAX2d+iEWXpXZTIh
 IBuZJYCf701l302D6IkiOioC22W6KNNCCUFKUWhOpQ==
X-Google-Smtp-Source: APXvYqxUKPIKbTIZr1M6Bq8hTmUmtbRUX1wWsBdS/udmDjTP13yLTUgo3zxgbFU+4VS+rTqhIqDGEZpVYzTnUrokkCs=
X-Received: by 2002:aca:211a:: with SMTP id 26mr524117oiz.122.1571701637425;
 Mon, 21 Oct 2019 16:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
 <1570635389-8445-2-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1570635389-8445-2-git-send-email-fabien.dessenne@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 21 Oct 2019 17:47:03 -0600
Message-ID: <CAPnjgZ33+J-10WgcmFBjGuqJ90caJFj7mGy+vApbxAyymCXvZw@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] remoteproc: elf_loader: Add elf
	resource table load support
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

Hi Fabien,

On Wed, 9 Oct 2019 at 09:36, Fabien Dessenne <fabien.dessenne@st.com> wrote:
>
> Add rproc_elf_load_rsc_table(), which searches for a resource table in
> an elf64/elf32 image, and if found, copies it to device memory.
> Add also the elf32 and elf64 variants of this API.
> Add a test for this.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  drivers/remoteproc/rproc-elf-loader.c | 269 ++++++++++++++++++++++++++++++++++
>  include/remoteproc.h                  |  70 +++++++++
>  test/dm/remoteproc.c                  |  91 ++++++++++--
>  3 files changed, 419 insertions(+), 11 deletions(-)
>

If you are putting stuff in the image, should you use binman to build
the image, then find the contents using the binman tables?

Scanning the image for a table seems a bit horrible.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
