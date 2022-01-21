Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C794961EC
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jan 2022 16:21:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA460C5F1EB;
	Fri, 21 Jan 2022 15:21:24 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA4D4C5F1EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 15:21:22 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 f4-20020a4ac484000000b002e3e221d769so3427463ooq.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 07:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Fzw+IY+KOXPr27ExjkktqlQ+tMIIbhoFs3ARafWLd8=;
 b=CiQVJKicLF16DMMO8bKmctUGUp9EU0R7HyOuzrrn/DaZKHdmLpWFpmANnLVR6KCMc2
 oDS2TyU6lD4HbTJJDpVx5QH17DsvI5uNkQOr323irSTsrbVP8zktP4xY9xzzDdeZvzmJ
 ARmHeCdnstHUkcWbB00GwjnglX5AHkz8ea/+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Fzw+IY+KOXPr27ExjkktqlQ+tMIIbhoFs3ARafWLd8=;
 b=P4KLSxX0zcREu4mZaDUIiGxxlM5xWv/sQw91qLSPAXVgcIepOdO1k5sBEfZ+tgNpgn
 ITUbXHdALiErdQJVsH4+MTOLUSH8owj+4db1lP5NoKNP42xYWGxyKb/xn5Y0PpNAd06A
 lf9XPNMGfR6rp6N4nE35cY+9dsHTPnvZbhPYEBp/1UY+5RotFLfxnkR8Z0Qz+jABM+Vs
 zhMn7inxUrV8ww0Ikg4gKR6OhyI+3iknX9Bh6IN4F+L//rX+mVOGD1jI7aNh4zYscxWx
 G/KOe+rfeyyJBVonvYAE9D+lJDbIZX8F74OduylU6T6HLZOaGDzzdUY2xOYXLx9pmaDO
 XX6w==
X-Gm-Message-State: AOAM531rxQzJzS3xVN/UB0wY6FNyCwpmhVLwJHZbdpGHfT7M0UmWWDpj
 0wmiLV9N+k+oXq0STqfKtNRom8N6P3DLxlpfzCemeQ==
X-Google-Smtp-Source: ABdhPJx3DDEIZhn5Q6fSLpJu3acEZYM5zqSZmGDfnEV+ikomw5U5wiWM2AQJm81nZPIxd0xFIoiPCfwlDzChq0lO9wA=
X-Received: by 2002:a4a:4581:: with SMTP id y123mr2839942ooa.39.1642778481504; 
 Fri, 21 Jan 2022 07:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20220104074248.25015-1-patrice.chotard@foss.st.com>
In-Reply-To: <20220104074248.25015-1-patrice.chotard@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 21 Jan 2022 08:20:37 -0700
Message-ID: <CAPnjgZ2uJjByHMftsfUn=Nbh54KhACNmEnmgDVTgF7SOpqo3Zw@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] dm: Fix OF_BAD_ADDR definition
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

On Tue, 4 Jan 2022 at 00:42, Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>
> When OF_LIVE flag is enabled on a 64 bits platform, there is an
> issue when dev_read_addr() is called and need to perform an address
> translation using __of_translate_address().
>
> In case of error, __of_translate_address() return's value is OF_BAD_ADDR
> (wich is defined in include/dm/of.h to ((u64)-1) = 0xffffffffffffffff).
> The return value of dev_read_addr() is often compared to FDT_ADDR_T_NONE
> which is defined as (-1U) = 0xffffffff.
> In this case the comparison is always false.
>
> To fix this issue, define FDT_ADDR_T_NONE to (ulong)(-1) in case of
> AARCH64. Update accordingly related tests.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> ---
>
> Changes in v2:
>  - define FDT_ADDR_T_NONE as ((ulong)(-1)) and keep OF_BAD_ADDR unchanged
>
>  include/fdtdec.h   | 5 ++++-
>  test/dm/ofnode.c   | 2 +-
>  test/dm/pci.c      | 4 ++--
>  test/dm/test-fdt.c | 2 +-
>  4 files changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
