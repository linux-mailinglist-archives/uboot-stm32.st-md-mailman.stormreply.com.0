Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0AE14D520
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:17:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04E59C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:17:53 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AF90C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:17:50 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id q8so1605151ljb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WBoR11yUMUcMk9rM8glI8xaolZOkZhbxGl+zO9C67mc=;
 b=b4u+N8WXyFxhtjMwI/9aYhjakp2DW3UBP0PHjqP88EOjSFWQR0ZZseGWqVhDv42MAR
 XJDjB2vgPOhoxnTV9BFZ5Kl/XdLLOGv8nsah5n7SfxpxAoJRK9SMyWDcqHQo+wEEN6P9
 l/gXgDs+gC2MxUE6Xgg1FbrkR2K32tnZQEuvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WBoR11yUMUcMk9rM8glI8xaolZOkZhbxGl+zO9C67mc=;
 b=dA6ZJ4Iq57mdixpmHdcVNpJCeOOQ87S/pPEAVxls5h+4Mci4f2ATeWqXwojtNsCvgA
 WjpEnLyqMAAJPx/KlDmpz+0LJfGZcl+un2SbgaPYrBLwwRI/7zgXX+qOWsVj4tNpAyYZ
 KTIG6Ex6i8YxFINx2VJrJHd4F3VIkPrYIB+fO6GzhLVwBCvTzsxJ8E+KNpVP1ZNmgFmJ
 4yy1B+3M+JYav2PzkgNHOES/EpZq6cjN8bLOeY5UsivfYfnFNhbnex55yjJdeYN6enDg
 YsYZkgrq22kktnwvk6A5w9gar5GOR3ypM3rwilOmDvQQuVxgTjOSWHdkYpsdjhvC79H+
 k27w==
X-Gm-Message-State: APjAAAVD0o5Pk8jSFBvFAuvw3KfYHDqQkRzMdD99/M9mnra6tHCBCzCF
 mbBqn7W0c4RdAsczuf8BTatdsosp/pI62Kl+oJNmcQ==
X-Google-Smtp-Source: APXvYqx2PyflKpBou4jBJHi/0MTML/4QAO9kK09ieHJ8Gr7uyvxp07Shg1F+OCVElpE5AJ71YwbC6pn6NwWia5Adubg=
X-Received: by 2002:a2e:3c05:: with SMTP id j5mr1176294lja.131.1580350669448; 
 Wed, 29 Jan 2020 18:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20200109171123.16348-1-patrick.delaunay@st.com>
 <20200109171123.16348-3-patrick.delaunay@st.com>
In-Reply-To: <20200109171123.16348-3-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:17:26 -0700
Message-ID: <CAPnjgZ1sZ=U7GFY+-RybYV9iL8hgo1fE9En+Ni0tg2E_2SKoaw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Tom Rini <trini@konsulko.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] arm: set the relocated gd with
	gd->new_gd
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

On Thu, 9 Jan 2020 at 10:11, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Simplify the arm relocation behavior and get gd directly form new_gd,
> as it is already done in crt0_64.S:
>
>         ldr     x18, [x18, #GD_NEW_GD]          /* x18 <- gd->new_gd */
>
> This patch avoid assumption on new GD location (new GD is below bd -
> with #GD_SIZE offset).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/lib/crt0.S | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
