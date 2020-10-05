Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2556B284223
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Oct 2020 23:32:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCDE4C32EA6;
	Mon,  5 Oct 2020 21:32:32 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1570C32EA5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 21:32:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g12so5746049wrp.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Oct 2020 14:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=R9DmWUffQpjlvmQc1eUVbEI7NeObHxP5Ef8Lqq9sU9w=;
 b=HOtiqh/QQ96qnA+Gz1VFA3k6dNor0vPsqAwj4/xEKAdLC/9tLkhBmyK4PZpQ5ECtzn
 le7OrSu8VW1jTU3FNfZMYDYD1wnJ74OlLUJYjT+Eego2PO/LluiCnTwW9lfjhclBuYdU
 P3mIPOCAUgLHs7GWPJzaOpH8z4jI7GnGwq3Wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=R9DmWUffQpjlvmQc1eUVbEI7NeObHxP5Ef8Lqq9sU9w=;
 b=I2zBCJ236P7WNDVTWZcbcxAC/r+/+sSnrB0O+qVuokuR5t6sShC4Pclxe9g0cyMr8Y
 Gco9aBhorTdQIcjakRcFWtk7NlDrprl4ASALGgm6MI+wZJW4NTNaygGNpMnvHS0IXnfi
 l159ELL+eROPAQoy1Y4asY73jPfvpRUH87GPOP6hy9DXvf7MDFVODq3IXAAjkdQrqdG/
 31EYG78dHt0y5yYejm5jkh92s2Agcfn5YkXA2Ua82JOosM8DxXzDzhT/0Wx2Sqhb+wUk
 e16qxVgxeSJUbt2r9rFrzeTukxDqlTXEtAknTWZX+Rzb//7Tyml/ZvuCWVTp5zWaIH0/
 xdug==
X-Gm-Message-State: AOAM531FfvivdXhxLNl8toWyQdN22Hs7/tOd+uT8sA6mNJp0WBwE4YMY
 zYyRozl9jCXR7EGc6WULWgE1Hxf0TxasmiJM5nrCeQ==
X-Google-Smtp-Source: ABdhPJxFRhSpr0OwCd/tIALuSbF32+qnyLwre31iCa+MzyXhe8kS3ALTKSZkLJFA6oK26lCSd6MYTt12nPWBgCNVzfg=
X-Received: by 2002:adf:9282:: with SMTP id 2mr1287960wrn.43.1601933550844;
 Mon, 05 Oct 2020 14:32:30 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Oct 2020 14:32:28 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ2O8DvUQ6CsWeWQbabidqkK-zg04xKd4gCd+A0M8ZTZCg@mail.gmail.com>
References: <CAPnjgZ2O8DvUQ6CsWeWQbabidqkK-zg04xKd4gCd+A0M8ZTZCg@mail.gmail.com>
 <20200925074116.16068-1-patrick.delaunay@st.com>
 <20200925074116.16068-3-patrick.delaunay@st.com>
Date: Mon, 5 Oct 2020 14:32:28 -0700
X-Google-Sender-Auth: tnEnKSQUaD9Ckd3Gnf_-on3tkMY
Message-ID: <CAPnjgZ0zwUeA510pM_VNySB-r0kOzg9GXGye=Zn+GpOUsskjEA@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Schocher <hs@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] test: dm: add test for phandle access
	functions
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

On Fri, 25 Sep 2020 at 01:41, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add unitary test for phandle access functions
> - ofnode_count_phandle_with_args
> - ofnode_parse_phandle_with_args
> - dev_count_phandle_with_args
> - dev_read_phandle_with_args
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/sandbox/dts/test.dts |  1 +
>  test/dm/ofnode.c          | 75 +++++++++++++++++++++++++++++++++++++++
>  test/dm/test-fdt.c        | 65 +++++++++++++++++++++++++++++++++
>  3 files changed, 141 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
