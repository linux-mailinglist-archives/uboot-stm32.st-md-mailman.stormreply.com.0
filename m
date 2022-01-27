Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E6F49E570
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Jan 2022 16:07:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EF52C60465;
	Thu, 27 Jan 2022 15:07:03 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2C8BC60464
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jan 2022 15:07:01 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 x52-20020a05683040b400b0059ea92202daso2808717ott.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jan 2022 07:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VBIxD5mX/YDWj2OKr+eDjmlGXdktWmeYu3beeIgADuU=;
 b=QZQh07wB4QinsBezVTi3q1LeHb267Sm6uaJ9lVGZ0yPlL5idUazpdmqjBUPD9393XG
 o2ViZtbsThLdzm+fsv8rMDjxXJgi9b5lcQYksw1cjy9Ougw3pakEmFE3g8B41y1fhI8L
 vfO/FD3qihD+/9D1BjezZxeFU4vY/o7js3+l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VBIxD5mX/YDWj2OKr+eDjmlGXdktWmeYu3beeIgADuU=;
 b=1B+osU8xbcj7UkC4yw3Jb7xe6sQVoLQfyoF5qgnMIlM65wlohnemO09ROvqRuIdUG+
 l+ZJatVnZoIroURMS7XSOIQCxgD6VX11hDgQQ2bLIr4+GoCe7rroRduPyLiNiRdPRRmc
 B1ZWoT40hDm5Mzgyc4Mg9anU+dsxOu8zmKnoopqIxS3up83WSjRakqtViT8/aQjGAG3n
 DQ0Ig4CFJ41PHtpY6XsMpUNR8GLx/emUHEglWvSG3XGyEyVeYTgbv1mAZByumgc994EC
 q2ue9JgE2t/Nwe9WoIenAXPpvBQnTq50i/rqdBJXzP/tJr2pqRRl8m20sE6gqMS9f9gF
 qGfw==
X-Gm-Message-State: AOAM5314SNq5/SKP+tuBBxpaqEEPQKiN3dzz/tZeAWM6IghrqjmU2X0Z
 RTifBC3YWZCawIUX7saiWyzu0RhXgZ1bFUlktaV4CQ==
X-Google-Smtp-Source: ABdhPJybo1oC5M6CMEey63ihOkdsjl0tqfLXkCc6q4xZKGcIZz60PU7PEzWQ1LJVsRXmcdyPwJuKzJp9mCZiwYbp5Lc=
X-Received: by 2002:a9d:3ab:: with SMTP id f40mr2239695otf.351.1643296020319; 
 Thu, 27 Jan 2022 07:07:00 -0800 (PST)
MIME-Version: 1.0
References: <20220117154922.1085936-1-patrick.delaunay@foss.st.com>
 <20220117164919.v2.3.I8b2905e3dfc95c21afd004977b40787144509b5c@changeid>
In-Reply-To: <20220117164919.v2.3.I8b2905e3dfc95c21afd004977b40787144509b5c@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 27 Jan 2022 08:05:49 -0700
Message-ID: <CAPnjgZ1r2es+rUV2QOJnBo70EOr5EYiJSkMCCY-ZcD-C74LBWw@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] sandbox: test: activate tests for
	the command LOG
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

On Mon, 17 Jan 2022 at 08:49, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Activate the CONFIG_CMD_LOG in sandbox to execute the LOG tests
> by default and correct the test log format after 72fa1ad8d9 ("log: Allow
> padding of the function name").
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v2:
> - update commit message "sandox" => "sandbox"
>
>  configs/sandbox_defconfig | 2 +-
>  test/py/tests/test_log.py | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>



activate tests for the command LOG
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
