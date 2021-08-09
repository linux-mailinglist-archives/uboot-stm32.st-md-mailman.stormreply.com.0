Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6203E3DEE
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Aug 2021 04:31:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0948FC57196;
	Mon,  9 Aug 2021 02:31:36 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95E40C5718D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 02:31:34 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id h14so19325305wrx.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Aug 2021 19:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=xXdXzH69mzkU5fkIqp3jAzzOfRvU4MhscNqC4+gGfqw=;
 b=LiODUDPOuBxp1EXzKiFMbFQ3kra9MaSet/aRzOjpXtmQxs6QrNMoUKAGZRhtK2YH/a
 dcQiCTSH2ppF0o/4zZoe+auskPlenUs6bGTAMJMlsCGJ3hwU3yn91ZiDRXQp879a1ClX
 neixp49WIGbA8Rzbjtc5VBByTzTgh2I7TY4YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=xXdXzH69mzkU5fkIqp3jAzzOfRvU4MhscNqC4+gGfqw=;
 b=EsGKA3Dt5siT02491sFuomaMwHz1oDpkXjBIhNPmx6eF4HpXla/EF5imOFoG57dkXz
 RYhgfiB+4XwUJ+TUVyZQj/fY1OrlflD6ZULxSTMdukHRAmgFPRZWaTjbhjWAlotDNxKf
 tpb00srIUeZE0pXVctbT/vMWJf6rHuL2KiwqshwsO1n4IGDHQhHWgrPGQgUlyusH4Nw4
 SWn2xTN04girQ8LvuFrm9ophx703qYF8wZ2f0hC4l2jCNu3D7ruYrhpsUN0f2MkE1u7Q
 H0vAuAWKA7hhKjPH+VXBysisiNa2ZQnyAyUqNZ9UpqsD9w2L/fEdFEA1WJKUwx76wzCR
 Ujmw==
X-Gm-Message-State: AOAM533nGJYnV97TNdgxnXPp7K2o5nD/XAsPz7d2krOU9t0fXuNL4LfB
 Q3pXYyySoqbEnQZQ3tfp5cuSDvAelH0fPBORAilxKQ==
X-Google-Smtp-Source: ABdhPJxlAl71mzKZgggeZMJ4/aPPiDdvtFC6h/MXFKXoPOCE9oooW035PjeDYrH6q5y49hrCSTUFY1rHtk7oYBkjLPg=
X-Received: by 2002:adf:9c8b:: with SMTP id d11mr9573497wre.43.1628476294007; 
 Sun, 08 Aug 2021 19:31:34 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 8 Aug 2021 19:31:31 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ3kObVoBowEEjaRzrzJOO0GJcSeUnYWpKJtAq=KLBuGyg@mail.gmail.com>
References: <CAPnjgZ3kObVoBowEEjaRzrzJOO0GJcSeUnYWpKJtAq=KLBuGyg@mail.gmail.com>
 <20210730121253.1.I548969a35a3522881113dc073f34b86bb15d29a6@changeid>
Date: Sun, 8 Aug 2021 19:31:31 -0700
X-Google-Sender-Auth: ab1tLTwAIRM4Clx0XkMT6f55XeM
Message-ID: <CAPnjgZ3ZDL7keatfx=R6GM6j=qM4KXiyxOg28UNbR7drp-eTng@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
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

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
