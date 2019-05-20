Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BA323C39
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 17:35:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F66EC5E2DE
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:35:57 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C257C5E2DC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 15:35:54 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id v2so10319786oie.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 08:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lm/kL+sVnM1xYYhLVoFK+tnAYpwgjOuLpC2ctH7iWnM=;
 b=CliHFU+yJFd8inY0neYA/57hWJvDn6N/QB3D9u3HzVKGJIeSwnrFqbv8hxgy+d+Ta5
 ytNeiEdG6a3QxX/si4p9IuBBCdPP3hk0MXzpG1kvtXIJHHGBbUCW65wVQZJ3YEDMUdIv
 SywqAcbKvWRRHz7g/lIo9t98m+Z6N0DdBxVss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lm/kL+sVnM1xYYhLVoFK+tnAYpwgjOuLpC2ctH7iWnM=;
 b=rrGBLXmkHA2espivdsXPdAamppYmRWHU+ZQgNIU4M2ofN+8cTXdexRV6zGDO2uYjXg
 ByRoxYwX2+QhsCeoBYs1Gu47WCXwDslv4lLS/Ggd2TJ+6z4qv09YFRJDkpCX990JPjCb
 SULulwa0eibYFcCpwq1fuIagji4bIr1BKhWTAUFm8VFCqmjFFzcir5WRoAgX5JZ+3FwM
 zSiH5nMXE1+5K2x/kZKca0B8+Y/KwyQrjO8/cQxl3WosCRlSewJ5xwdWDwouIbZBmwOL
 pDBbNTldWAEL5jSUSA2Ti3Uin5WhOmA3yBFYovfgwY0gQFuizEEoWDCxvJ+ruqvN6WZn
 BJbw==
X-Gm-Message-State: APjAAAVFLxEK/u6pvdfAo7SUaC5G8X3jRGniv66+VLVabpKbjAra6Qp+
 84u7jMrUqyU0ukcQrr7GD6ukANoqmQuuwzF4mpR+kg==
X-Google-Smtp-Source: APXvYqyIbP2rNH8EhkcgN9Rik5qzyRDkR97v7gJk/kQoarv3ZTZWAd5pADaY7DpjcxYqoio9afpGDZm8/cgChJY5/bc=
X-Received: by 2002:aca:4f8e:: with SMTP id d136mr9516100oib.122.1558366552907; 
 Mon, 20 May 2019 08:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
 <1558357207-7345-4-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1558357207-7345-4-git-send-email-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 20 May 2019 09:35:37 -0600
Message-ID: <CAPnjgZ1id6b8oufRb_QttcdkQju-LO0iduFZuV2UKQrsbpMz4A@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Alexander Graf <agraf@suse.de>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v2 3/8] sandbox: add option
	show_of_embedded for spl test
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

Hi Patrick,

On Mon, 20 May 2019 at 07:00, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add an option show_of_embedded used in SPL to dump the used device tree.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - add new option for spl test: show embedded dtb
>
>  arch/sandbox/cpu/spl.c           | 188 +++++++++++++++++++++++++++++++++++++++
>  arch/sandbox/cpu/start.c         |   9 ++
>  arch/sandbox/include/asm/state.h |   1 +
>  3 files changed, 198 insertions(+)

Why not use fdtdump on spl/u-boot-spl.dtb ?

Failing that, can we use the existing code for printing a DT?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
