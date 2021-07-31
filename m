Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3CE3DC70D
	for <lists+uboot-stm32@lfdr.de>; Sat, 31 Jul 2021 18:59:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5430EC597AE;
	Sat, 31 Jul 2021 16:59:54 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B6E0C59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jul 2021 16:59:53 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso1405586wmq.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jul 2021 09:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GRPpf86/0Xv82j6ONc4cFahOpq6T9+1fK/R9fWJs8lg=;
 b=VG8h05Xh0ws1y3vtzIq9+7tZlnEEhsZz8u6dOonaEj2zOPjmxdCo+8B/UkVw/WwNU7
 Hmt3ASze5yyzbw2B1beUXJFtZIxrdyNyJNSNa6g/DPjQO7BIzx8FqIdOirtD8+AY0BYc
 xWPfaO9vh/iBirbAbwY98F17sub6xipMFVebs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GRPpf86/0Xv82j6ONc4cFahOpq6T9+1fK/R9fWJs8lg=;
 b=pHnnYlElwbcnOfz0rSWKqjkgZ435dZqIlZtDU6joh1Hr9+Bq1KyBPzf53Pugi4BB5r
 TJc5rBmAaNr6tkLEFBTui6jVjiszB0tDaHpf/Ukr1gnJToaNlGtSc7e97IsKDgM6pFFB
 l/ZjgVRtwpvKdFWWWBiYmlFbKoiywWLTiBgwZILzVu0LUWgf2h1FkicndX3bMYPiZhte
 HdEJiuqeNzKPsv9AstKCFN7skM3dmGUMTlsizvYWxCNXyyZWVWt9cnaDjhyhe7AfDD9T
 Jtml6RRJLs8Ipib24I+40elomWS2zpuqBNBsDzlBFA8BikpB0WsZFPeBrQ+uaprYVSJr
 y+xw==
X-Gm-Message-State: AOAM5303NMFnjdm/kuQdh+5O3pmTAau3+aeMoX7KQv5T2moLH1Z8tcWQ
 6a5SCBSNqFUoVwTpfRf/TEhkcw0G2JU7qeLMF7e8BQ==
X-Google-Smtp-Source: ABdhPJyWLczI3GDBJklcHZKN67su/gZ23TIoZjL6u3kFnDffHqjB8VOxlO8TV58k2CJqpNsfXqEqEiJMEYElM7LgKxw=
X-Received: by 2002:a1c:7515:: with SMTP id o21mr8896466wmc.65.1627750792536; 
 Sat, 31 Jul 2021 09:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210730121253.1.I548969a35a3522881113dc073f34b86bb15d29a6@changeid>
In-Reply-To: <20210730121253.1.I548969a35a3522881113dc073f34b86bb15d29a6@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 31 Jul 2021 10:59:38 -0600
Message-ID: <CAPnjgZ3kObVoBowEEjaRzrzJOO0GJcSeUnYWpKJtAq=KLBuGyg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH] dm: migrate the dm_warn to use the log
	macro
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

On Fri, 30 Jul 2021 at 04:13, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Migrate the dm_warn function to log macro with
> LOGC_DM category and LOGL_WARNING level.
>
> This macro allows filtering with log command and allows
> output on all log backend.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  drivers/core/util.c | 11 -----------
>  include/dm/util.h   |  2 +-
>  2 files changed, 1 insertion(+), 12 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
