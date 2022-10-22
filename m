Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB48608309
	for <lists+uboot-stm32@lfdr.de>; Sat, 22 Oct 2022 03:06:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 049AEC64115;
	Sat, 22 Oct 2022 01:06:08 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC4C4C64108
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Oct 2022 01:06:06 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id m16so11736077edc.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Oct 2022 18:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:references:in-reply-to:from:sender
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1QXBprTX7dBXjyhzlrnkd8jDpJpUTWZ1rnqrcFx5obg=;
 b=TMtuw/InLB49lj3FrvZ3E6iPjyNh+v+veaLGVjDLrIKcQmRAlbVzpKgJ6/WKhSJNZ1
 dkGQb8V1EzFnObnsYo8+BSn0GD8ho3Wd1O+cVXejxoO1jevpCtJrSlj3PnMERX92I6eW
 rY+EOAaydf5O0mQusaKikGhypkvstwN3ZZfdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:references:in-reply-to:from:sender
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1QXBprTX7dBXjyhzlrnkd8jDpJpUTWZ1rnqrcFx5obg=;
 b=vquLX8N54cYCyRoBE1s6NYC79XplEbqC4YQKQjHcvW2TKQ1HaHsb9vpTEZ5hZ4r91r
 WfIU8XfEeDgkHPoBG+i2Ok3gCza2/Qtca6Gq7RlKiEJdR7bfoGe5J9k3hMWPso5rCXtu
 8j6/Z0Y6atJPUoTx6sZDPdeJdp/zE4gaK7VkzlbSH5hMW3gItJ22vWif70Kzl0Gu5ZWm
 CKVMwRR1GGXqP7EH6PTNK6OBQrU9M/oRRj4Sa9QQ1fxlu4x/Kb3cdqCIul5Yf1JMND5j
 Zq4wSdjPRULmML/PjKCIAmV+u5PI9h5sEsrp6ixs3CjClpd2IjRQ3S3by06dWAvP04Mh
 WsjA==
X-Gm-Message-State: ACrzQf032nFj8saF6yeAVCWfjY8upowsBlB9/9mZhOiUu9AhIPfq6soK
 ChBtiHWG0Y7SG01DywrsjMG/4TuQxc4dxQDIZtBnPQ==
X-Google-Smtp-Source: AMsMyM6nIPHOUI1G3YWk5Mj0SYPEfHjHKFeQk5c7rIhhUYLXAk5i3v+F4P6WZ+Wu6+KO6J3lhMQsyPLPVt/ro14TI+Q=
X-Received: by 2002:a05:6402:d75:b0:459:fad8:fbf with SMTP id
 ec53-20020a0564020d7500b00459fad80fbfmr19720465edb.0.1666400766101; Fri, 21
 Oct 2022 18:06:06 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 Oct 2022 18:06:04 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ3w_=AZg+WyVvUuyYue=wdfbqpcJBhEsHi=FaNkozSLrg@mail.gmail.com>
References: <CAPnjgZ3w_=AZg+WyVvUuyYue=wdfbqpcJBhEsHi=FaNkozSLrg@mail.gmail.com>
 <20220927101756.1.I33483759ec654ce103609cc3ef13a6162b722975@changeid>
Date: Fri, 21 Oct 2022 18:06:04 -0700
X-Google-Sender-Auth: oWqzINqkRMvFOLnH7jeLg7H8ilo
Message-ID: <CAPnjgZ2E0Syvc7SfrP3NVSS_97EisjKsWtobz7MttMUSRQ9zqA@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] fdt_support: cosmetic: remove
	fdt_fixup_nor_flash_size prototype
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

On Tue, 27 Sept 2022 at 02:18, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Remove prototype for the removed function fdt_fixup_nor_flash_size.
> This patch has no impact as the function is never used.
>
> Fixes: 98f705c9cefd ("powerpc: remove 4xx support")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  include/fdt_support.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
