Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2F42AF3A5
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Nov 2020 15:32:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEBF5C36B36;
	Wed, 11 Nov 2020 14:32:57 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E86D5C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Nov 2020 14:32:56 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id f16so2276223otl.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Nov 2020 06:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rFXM4QOeaR6tflYaKJPwOI+q5NDDOgXZdS75mIGWyKk=;
 b=UIWxwXDgnNEapPydD0KnHIcG0zqxmM5gCz5fLRQPt6IoLFuOye+F7wwBg2wUt/BTvi
 6kBdOY2xcfP+1JB/I39VoBis0YYnVNXpet0vy7NKb79It4okcMYbpXEwtzTezIzQ5g01
 8ZFqjmCeXD2/827NlGpkhNz8EgmuBHEkWVWcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rFXM4QOeaR6tflYaKJPwOI+q5NDDOgXZdS75mIGWyKk=;
 b=iNKTwkOG0qhuz5VFpceF/3mxQhEXKS4/N741YxE9oaGEcHz4aA3PSLSGWa7V0GKR3Q
 JEefT2FxILlHhy0QOWTVVhEcb+GLcDji0n5Aux1smfXnu09O/bxeeQ40uzxsWG34Q/5H
 gn58jJb/p7QsbGQ0ndPHQgsVb8v8k/VUZokWs5d79FE1xUOeX/TzOQl812HboMYtC72H
 GR1rZfPtwiZU0BT+RzPMJYp3LtQGvwz0a6npNIwwqAw6oWcRULKFUVsP+4z7aLbLhr9c
 X3e734lKO/0xqTx5ExH1kL3QM2ya+QFmi9GWx5k0xLOlZMybLXT84/ct4ZKhawwqIagr
 rQYg==
X-Gm-Message-State: AOAM532FZDTMj0ts8QjmCNeWUREbFW5wUKQ2O6t0ewkiy4kJWH5hst0T
 Y+DTDk5m6hs971EfK3PX4+3anTqRMzyD7HE1IhQjCg==
X-Google-Smtp-Source: ABdhPJyFdjFK5q1GQd25fmsUa0z3BMXSsUCnUzsKnFJ1tyfUKoIdnBDAxYsNK2Ku43CbYqk7USvwWhKv5Je+XPWssN8=
X-Received: by 2002:a9d:6c0f:: with SMTP id f15mr18902710otq.54.1605105175446; 
 Wed, 11 Nov 2020 06:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20201106175339.30683-1-patrick.delaunay@st.com>
In-Reply-To: <20201106175339.30683-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 11 Nov 2020 07:32:00 -0700
Message-ID: <CAPnjgZ3KJnkT9dMNdwyJZqd=nhjPeXMtBXQ+KnihfKORGnHKvg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/3] log: don't build the trace buffer
	when log is not ready
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

On Fri, 6 Nov 2020 at 10:55, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Update _log function to drop any traces when log is yet initialized:
> vsnprintf is no more executed in this case.
>
> This patch allows to reduce the cost for the dropped early debug trace.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  common/log.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

But this needs a test.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
