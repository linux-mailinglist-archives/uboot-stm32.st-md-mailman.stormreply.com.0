Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF24D12CB8F
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 02:21:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49FA7C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Dec 2019 01:21:21 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCF41C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Dec 2019 01:21:20 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id l9so7951122oii.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Dec 2019 17:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q1J4uQplUOTSGWwj0z0f0ifYwRWQaZqnUyxk2+mRCVw=;
 b=JCHtWFnTrdAMI2oxvcnTjmesrCVcuKVXa38mfDvntjed49JWtY+rH2+OvoBRnDYDpo
 7qEOvBc0H9fS5CXt/2gs5DWYONtp+5r37beG0yosgqnACWo6ANzTE+54ElsiaHlOTqDs
 DOXUqD6EoIfcXWi5UZsthq/ZYSF24gTVwEz4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q1J4uQplUOTSGWwj0z0f0ifYwRWQaZqnUyxk2+mRCVw=;
 b=T3+yLO9iQoV+j8dU2ISC+MNRKtdyIAo7QwPvCOpwCRNDPXjx9GECvnM6CtkeRHkPyM
 KJFh/m2dgHxO5u+y84L77T3ptABbE7FzZIhgiGuBgGptOaiC0nnvvbBHLRXaQbd0NWmw
 /raSEL63Bz9em1O5dGgEWG+67VXreaFSJ/nIxKROH/j+OgXwhoO2LfYyLIMLUBX07m23
 gQ7gwh003wlqb9y/IFfnCpvUqN9QQhjM0fPJeG0miBspi/CvsEnpLJYAE0Kk5uUrdXP7
 Zn12zajKeyi5duS3YCkzE+2hNMqhLuu8LqlloNLha9myVu1B7GkeCIIV77FxQXJMrd3b
 LBKA==
X-Gm-Message-State: APjAAAWjgGGvKqL1QNd4i4t/SKZUPKYkZh9VaDz0lDzYbjKcP2LoCgL0
 P9ZCY8D9nU9kvjH3yMK7dibVQP/iGTo6EI5kPJE0yw==
X-Google-Smtp-Source: APXvYqyUSLw3T3s6pTvCc8SGYEnPV8Wcbw0UXkYYEiQcVi9X7FmOiVK096DV/HOllyjTttrUk89fstKFNvNVkNRyVTM=
X-Received: by 2002:aca:3182:: with SMTP id x124mr5269382oix.170.1577668879276; 
 Sun, 29 Dec 2019 17:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20191126084911.19761-1-patrick.delaunay@st.com>
 <20191126084911.19761-2-patrick.delaunay@st.com>
In-Reply-To: <20191126084911.19761-2-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 29 Dec 2019 18:21:06 -0700
Message-ID: <CAPnjgZ2Qh_Mbmnu=eptqNXJcJNne4Khs6GV2bTsbnOfGShZeEA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 01/14] dm: pinctrl: convert
	pinctrl-single to livetree
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

On Tue, 26 Nov 2019 at 01:49, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Convert 'pinctrl-single' using livetree functions
> - dev_read_prop
> - dev_read_u32_default
> - dev_read_u32_array
> - dev_read_bool
> - dev_read_addr
> and get rid of DECLARE_GLOBAL_DATA_PTR.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - use the dev_ API instead of ofnode_ function.
>
>  drivers/pinctrl/pinctrl-single.c | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
