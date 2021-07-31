Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2723DC70B
	for <lists+uboot-stm32@lfdr.de>; Sat, 31 Jul 2021 18:59:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37B13C57B6F;
	Sat, 31 Jul 2021 16:59:52 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62E21C57B6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jul 2021 16:59:50 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id k4so4830440wrc.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jul 2021 09:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EesPz24Jv/NWub4OdUIfGTNB6qH+mZC5mANfna1cvxA=;
 b=U9MDIyzKrUo9wOrkpkOuFqnUgzWmaz51pqJSYSL2wSBMuf3Cp0N1vZUao/piOT/ILO
 szcU8nnZUBCTpJ5Fsv9eE2eYpZyOCgrPyOeQ8utnGBPvstnprala58lfzbc8jjBg/gHY
 E63Vkh6AGauS3S8LhoO1cizWoWIhA123Ko3AU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EesPz24Jv/NWub4OdUIfGTNB6qH+mZC5mANfna1cvxA=;
 b=RGyhHPAqI0z3I+FbpJc33WV7+W3WBnCU4paf/WtOWnKFrrdhiYlEfv0XMf5c81iM9A
 3LELgaoGiKvVacUctw8udR60yzVg0jri6jUfrLgc38Rr2mNsAoqa53HDuBkRCe3sqAJc
 m/eDffTmmivDAGfN4Sc+4LurMK1y6iVKWCPN841p/u7IN1/+DnkyBf9yBYRDRc7Lom63
 vyqKXvr8AET30b/xsS8MdSAkHgddkbqwCkO/zQTWnTQh4erNlhtcVkCPppH+ca/gBK8S
 gRm7lolRraR+gv7DX9jp/JZuWjpKPH98Tkhsm1Jimn8lrUIxZLwozj13+ENd3arM/PtF
 LQLg==
X-Gm-Message-State: AOAM530LvqVaBhQ5TpjCQhxeOewXDTXiiahFlneoFB0TfpTeNrPsFpZZ
 cklLwiy3rS2WpFsmO90WnM8v0L/nxXarWARkjGbfEA==
X-Google-Smtp-Source: ABdhPJxGA6SN14m3Px5UCz3P1sdlyEzSwbqarHGp3N9fY5taWKXpOb9TLITqy7fgG3EwFDmRN2GSmLg7XLy2sgCbx4o=
X-Received: by 2002:a5d:4fc2:: with SMTP id h2mr8971753wrw.420.1627750789201; 
 Sat, 31 Jul 2021 09:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210730121202.1.If3a702960ca11240d2dbce54d144144f814d588a@changeid>
In-Reply-To: <20210730121202.1.If3a702960ca11240d2dbce54d144144f814d588a@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 31 Jul 2021 10:59:35 -0600
Message-ID: <CAPnjgZ1jte+PHeK2py7raAOz9-4jq4mX+8CTBFEbaM7v_wQWmw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] pinctrl: change result for
	unsupported API
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

On Fri, 30 Jul 2021 at 04:12, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Use the return value ENOSYS for unsupported API
> - pinctrl_generic_set_state
> - pinctrl_select_state
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  include/dm/pinctrl.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
