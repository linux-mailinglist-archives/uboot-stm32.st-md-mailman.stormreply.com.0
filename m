Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC24660AA8
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jan 2023 01:14:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72163C69066;
	Sat,  7 Jan 2023 00:14:40 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 221A1C69062
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jan 2023 00:14:39 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id j206so3552145ybj.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Jan 2023 16:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qBH+N5sW9ZV4cqPQF4JOwEm501eXtSezEi905kpazbI=;
 b=d2EpE/4lXwes6TBX1Dc4CTfiJ9NmlXZJJb1MDodoY5WpNkk9wadYhwpCRWvovtwmCB
 OF14wROURpbDBacyBwNvW4Yf2SgUHv8ic5TUjd8/Va7poxr7IpD5v6zWV5gh+TC9EGKc
 ofnFpYH5SJukFq4XDwh7o8we/QZSoTzuZKvNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qBH+N5sW9ZV4cqPQF4JOwEm501eXtSezEi905kpazbI=;
 b=XzEeJZQW1ekSH3JbAR+QtIoi6mtTIr/wbpg5j+p31lRXYHGiGhyZatbtYu/CHe0sVb
 P+PqMWn+/wAhPGUN/7Z5duDkFZAKh9yXCW4Ss6GC2AMj7o5fZiUYcxTE7ATN0hOiIP7m
 lxnTdLLydeo/M1z6UgyY8dKe8StPcnNjn5bbRu3YdOGQjQDU6ZhOY++HhEMSkemnp5xH
 P4NqPHaBY6wEvDSZMdfZwtCVQtcX0rebzctZr3U1RWZFNb1JoZFaOOTy+R02skFNJQIX
 UAs6JthyHe9TEOWI0dS6KuJYDYD3gnDpRylF9xeM04szDJF3VY3TnxLwFExtXBGb0AFc
 wwcg==
X-Gm-Message-State: AFqh2kp9C2zQ73tGFQVPml2RGP571Ir3sg6StEwOnUXD4y7BN86u4bDf
 qMHu36Znw/rUgd5Xa+5B+1X408RkIAVKfMs33RJ1gQ==
X-Google-Smtp-Source: AMrXdXuwr93St8N82aK+QaD9/3ZkZn/IL+8Z0So70+gj5CZ5yPlk5icJVQ/hasK1ZTwi97w4JuYS2XU9gJuYxO1XS2w=
X-Received: by 2002:a25:6fd5:0:b0:74a:a7d6:43b9 with SMTP id
 k204-20020a256fd5000000b0074aa7d643b9mr4240341ybc.545.1673050477903; Fri, 06
 Jan 2023 16:14:37 -0800 (PST)
MIME-Version: 1.0
References: <20230103215004.22646-1-agraf@csgraf.de>
 <20230103215004.22646-4-agraf@csgraf.de>
In-Reply-To: <20230103215004.22646-4-agraf@csgraf.de>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Jan 2023 17:13:32 -0700
Message-ID: <CAPnjgZ0+ApQYVHnNNV=Yfp_YDsFuzi52s_sUAzd3dQgsQyyp-A@mail.gmail.com>
To: Alexander Graf <agraf@csgraf.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v4 3/9] vidconsole: Add damage
 notifications to all vidconsole drivers
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

On Tue, 3 Jan 2023 at 14:50, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that we have a damage tracking API, let's populate damage done by
> vidconsole drivers. We try to declare as little memory as damaged as
> possible, with the exception of rotated screens that I couldn't get my
> head wrapped around. On those, we revert to the old behavior and mark
> the full screen as damaged on every update.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: Da Xue <da@libre.computer>
>
> ---
>
> v1 -> v2:
>
>   - Fix ranges in truetype target
>   - Limit rotate to necessary damange
> ---
>  drivers/video/console_normal.c   | 10 ++++++
>  drivers/video/console_rotate.c   | 54 ++++++++++++++++++++++++++++++++
>  drivers/video/console_truetype.c | 15 +++++++++
>  3 files changed, 79 insertions(+)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
