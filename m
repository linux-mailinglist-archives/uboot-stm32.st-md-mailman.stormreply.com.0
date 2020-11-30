Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0848A2C8EBC
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Nov 2020 21:12:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2520C424BE;
	Mon, 30 Nov 2020 20:12:10 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83B74C3089F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 20:12:09 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id f11so15582562oij.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 12:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FvguLde84r0D7QaCPAyNVLQk03UWBZHfthwrE0E9cqI=;
 b=d4TYqmaXaEZ2Px76tDClIxTl2pmicJ4x5js8aBvnxVnBuT/Xi5LPWhCCcxvwlxWQIl
 61JjK5mx2oXTRWgXpTJLvuKISmrXZ/oEcEM5tlH/BkPrx4YS4ya/xbHWlehYq+nDrA/c
 mT13SYCY3O2jGeyQXmdG225GUWOIbGPeyLgT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FvguLde84r0D7QaCPAyNVLQk03UWBZHfthwrE0E9cqI=;
 b=IzsRLUh5d8J6Ui3QVKVJ/0QHdkcK3FDWDVaAEhJTy4Z8E4eWHRPfPCludyYSOabukt
 kpamBDY9TN3ABJwqBX8ZH25AdrnXzx1AhRomm1LhQXhZapaWmB0vZ4fyaS3xrYzSfkwt
 rD17EOICrkVlV2CsWIuZUBEqYAaunfdj7avxizjrDXju6u3DMUi3o1JSg18Z0BmKeew6
 JsSqJ5alTyzmbnFuI1+U/zlMjIc8rWwoPqnEc7ii/6qZGGMuOFPBwIjCBd554CkezdN/
 0FshM3LIck++ZTAyKtYAC9a3+rCZqpp6SrhkhP8o0LE5ajJTKDA6+3Orj8+MDmAG7Plt
 ovMA==
X-Gm-Message-State: AOAM530Pm8JzTYWZVWDEzoHAMHvBCjEP15qRaRMZ+Bd2fhGl3Hq9mtxk
 7X67oTDvJr6WR9tW178AsnURnvFqfOrySHsPsagX/Q==
X-Google-Smtp-Source: ABdhPJyvRVC8G+QhgBghC47CbO0RD65GfiifV2JRkQhmyFC+2mxBGL/KelhT4Gs6umhZEifHNXCFWZCqx/eVx8VD/ho=
X-Received: by 2002:a05:6808:a87:: with SMTP id q7mr467776oij.81.1606767127359; 
 Mon, 30 Nov 2020 12:12:07 -0800 (PST)
MIME-Version: 1.0
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-4-patrick.delaunay@st.com>
In-Reply-To: <20201127102100.11721-4-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 30 Nov 2020 13:11:53 -0700
Message-ID: <CAPnjgZ2Cx5LEdv1mxXbEGanyAgEHFk8OMHpKf3msv74H7aqmsA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 3/9] test: log: add test for dropped
	messages
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

On Fri, 27 Nov 2020 at 03:21, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add a new test to check the dropped messages when LOG is not ready
> with log_drop_count and the result of _log().
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - add test to count the dropped messages (NEW)
>
>  test/log/log_test.c | 43 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 8 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
