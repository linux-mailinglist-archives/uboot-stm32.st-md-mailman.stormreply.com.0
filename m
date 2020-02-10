Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77846158608
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Feb 2020 00:14:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FC53C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 23:14:04 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60ADCC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 23:14:02 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id d62so10942306oia.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 15:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sxUcjZN7AwGAr+InoWRli3JBsnrVG/g66SYOP3XEd+k=;
 b=S9aN8s+J+4EBvNmMvhlEgp9w4EwoBg0mTuupeJUpX3rExdVaOJACdyHdWIfuKjYpWm
 2uf7HPA31ByVCSV7TIBXgdBR/MzhknRzd+J7QHf39z/zUn9xSgZYwnm4ZUAxTJVGLhfz
 4Z2d7zvLtNOYG4dlteuCvG16V3gLFP+sLGCxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sxUcjZN7AwGAr+InoWRli3JBsnrVG/g66SYOP3XEd+k=;
 b=mMT+26k35e52YjsSm3EquUVZM+JZllmn7xqtMRt3Xyu0K/f7mjilctUcF6DL3Pv3Lq
 ZsYB1LIDkzReBChCNSLCBudLU1nzxu2byGchPsZUUqC3nqxA+zxy0Dr84uIgyjbeFIqj
 09LRMCL+KsheWAVj2QOtqsH28utHyV5+j//j8QIGzqvp+8nYPOdON/q9utlHzvQ6awOL
 x8M341c80XOVHrezQ0Gkz0MFIc/HMVq50SzLJNem620ohJnZzCBSDXx/fc2v3D2wT0bH
 cXv97rOcyrRIuhbRl5nd+/FcN8XsVr5HWF9Dsm3gs9KejyFbIpQjwbiasMqDxk5gI6hb
 aEcQ==
X-Gm-Message-State: APjAAAXhBkbJ3oYZMyshen5yVW/7CIJ8xKZjMiweaDnGT1foJdkEtdaf
 FMqbbo0ctjGJmL05Ico0B/8LXhaWbG5TMbIJEMdS3g==
X-Google-Smtp-Source: APXvYqwQwZxoUuo2zMDyDX7jczjktysU28bZfuFE9RDhAlMxLggt3d6sC3bTI7O1Y+bvgDYSwwQX4lC8YkoUYBtDXas=
X-Received: by 2002:aca:5588:: with SMTP id j130mr1021355oib.122.1581376440807; 
 Mon, 10 Feb 2020 15:14:00 -0800 (PST)
MIME-Version: 1.0
References: <20200210170129.8405-1-patrick.delaunay@st.com>
 <20200210170129.8405-5-patrick.delaunay@st.com>
In-Reply-To: <20200210170129.8405-5-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 10 Feb 2020 16:13:49 -0700
Message-ID: <CAPnjgZ1bGJUX_rPJpjfEvwu9TbAe4mrwfnHSoK5ca_mSoZNr=w@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>
Subject: Re: [Uboot-stm32] [PATCH v2 6/7] configs: sandbox: Enable sub
	command 'env info'
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

On Mon, 10 Feb 2020 at 10:01, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Enable support for sub command 'env info' in sandbox
> with CONFIG_CMD_NVEDIT_INFO. This is aimed primarily
> at adding unit test.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - activate env info command in sandbox (new)
>
>  configs/sandbox64_defconfig        | 1 +
>  configs/sandbox_defconfig          | 1 +
>  configs/sandbox_flattree_defconfig | 1 +
>  configs/sandbox_spl_defconfig      | 1 +
>  4 files changed, 4 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
