Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F10AF59D48
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 15:55:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9718C24028
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 13:55:12 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67ECFC28E2F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 13:55:11 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id e8so6011619otl.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 06:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wf7ZBKBDE3nlCKrppJSbxDbTeVYQIa8RUt6sr0z+ITk=;
 b=PvtoXcaqyiJv1QSzngpwdi6T3FqVV/EhTVA5Ch6+/1Kg6gI+VgYbnuiHL9T+9GvBu1
 0pzmXkBJN7pWBzmjQqOOu8Wp2YTAwymdl85lQ1krRfIzGQIvlfatEwiEJS2D2KiWDEpA
 gQHmXdIJNUcvg41dxI1MIPkGdeCMup997GBm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wf7ZBKBDE3nlCKrppJSbxDbTeVYQIa8RUt6sr0z+ITk=;
 b=X/IF8LAeZ0gln0QO1i/V7wsQv2FkWYnFUgGThwvL4DPrcCWduDO0WHU3yB2D0hAyz2
 tpA5UTSCpVi/9E2PWdQLVI6msG1IZjZjh1q0Je2AnjiZMuK9yHxIeBFclyXGDa2qKAGP
 fmO0Ru1JRKQJRQnxsJGzUfvHaJ3I6B5GdoHcQ9mavuKvwapqsH/2OTOM5351s8ssVnpC
 PEn0sEhSfY5mMA5qX2H3HhCaFUrnXxDDwZM/qlLJBQGf/iUGQpRO9z/dKgAxtHgB3oh+
 WWg+JGKhw4mQ5oTqGt+N3WuwNx2KZEY7AqxTJEsSCaqw9I8ghgcuv6f353Pxg+fFA0o/
 KUQQ==
X-Gm-Message-State: APjAAAX1pP5qjPnthr5kQq5l/24yxcTaYht2Z51lukK2wAy+JEO7VLX4
 IxIDdf7MQqGc2XVP+Zr9TD7u4uq8KpGm7biWsKhUXw==
X-Google-Smtp-Source: APXvYqyKZkXPcdQ5wvo7jJM5ibPTYujeh4l5BZ3Er0OAd7FVFTG0XSXWrASeKSv29KJb0SkUNda3VJhd2LrlldM85zY=
X-Received: by 2002:a9d:7cd1:: with SMTP id r17mr8247308otn.356.1561730109862; 
 Fri, 28 Jun 2019 06:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
 <1558459153-14104-4-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1558459153-14104-4-git-send-email-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 28 Jun 2019 07:54:58 -0600
Message-ID: <CAPnjgZ3sBNVNvb=3JmbRw-WLP_Pwadmau+ZB9QuhK63ZtXh3pw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Tien Fong Chee <tien.fong.chee@intel.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Chris Packham <judge.packham@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/3] dm: doc: add documentation for
 pre-reloc properties in SPL and TPL
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

On Tue, 21 May 2019 at 11:19, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add documentation for the pre-reloc property in SPL and TPL device-tree:
> - u-boot,dm-pre-proper
> - u-boot,dm-pre-reloc
> - u-boot,dm-spl
> - u-boot,dm-tpl
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> ---
>
> Changes in v3:
> - rebase on u-boot-dm/sandbox-working
>
> Changes in v2:
> - rebase on master
>
>  doc/README.SPL              | 16 ++++++++++++++++
>  doc/README.TPL              |  4 ++++
>  doc/driver-model/README.txt |  4 ++++
>  include/dm/ofnode.h         |  6 ++++--
>  include/dm/util.h           |  6 ++++--
>  5 files changed, 32 insertions(+), 4 deletions(-)

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
