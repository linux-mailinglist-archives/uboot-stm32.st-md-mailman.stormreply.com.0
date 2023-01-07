Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7703B660AA5
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jan 2023 01:14:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DC36C69066;
	Sat,  7 Jan 2023 00:14:16 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77585C69062
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jan 2023 00:14:14 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id t15so3543293ybq.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Jan 2023 16:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UcKdRmjHnJsvGOUA5mzn863oKdV+j+rhZ82+/ItGmQQ=;
 b=exHFDxA7VU/s/WIUIA9WENOiCXsV+OvCG4ihCnIkP5WWVCuChveTxjYvH5fxyIlWyI
 CE+U6GZdqklRv9gH4qQ8Ha48Rs7RXUjNEO+2KjS6anyQxRyhJI0qgT3iohQbwSsDUR8+
 01AVGtGCwy+FDK8tFvqayiUx1/UxzB+IJAves=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UcKdRmjHnJsvGOUA5mzn863oKdV+j+rhZ82+/ItGmQQ=;
 b=693R6Rg9xBHfzVka2iWiuunMNjSpkjlwP8y7AmUSuYjRs542CHkZ6vdwk02zw4VYc9
 WYE6sWNprqHauXlGOpd2dgQW+d7/DtV/BBop5b3Q8TSQ1E6XXjr2oBm9xycjdr/G4U+X
 NWFL1YM+TkzkQ7yJym992jchjnyVXidRQS9Yv6h22ea3mWzcvFpfi7u2suMxZCMU8mg1
 gPeADqSLUzP3o9/S2H/4j67ouUn1l8p30DK7h3x6eot5sb80JWU7ZwUan9DhO0LKY1jU
 3jgtpS3URPft3skH9FTbuPqYNoB9eWQGvW6dadligdc6K47BG7+RDMb16yEev9DlOoqb
 qRaQ==
X-Gm-Message-State: AFqh2koyk5iDIeNZHXjaKk0N/3Ecz15xUDAuMnh5qNPb2cqkhha8fG1o
 AXD1uw4QSzBY4JHVQDPVqxQ7iRUMA5ZBFPpxMLOWMA==
X-Google-Smtp-Source: AMrXdXs9FpUVAtVwAhBoc+1aG6Px059vfkxvz8CxQ7/VLF1UlqoNPGRfW0GJUeeU4PgCmp7Mii7uE2/Sn+LteciLtiI=
X-Received: by 2002:a25:7910:0:b0:6f6:e111:a9ec with SMTP id
 u16-20020a257910000000b006f6e111a9ecmr4316222ybc.259.1673050453186; Fri, 06
 Jan 2023 16:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20230103215004.22646-1-agraf@csgraf.de>
 <20230103215004.22646-7-agraf@csgraf.de>
In-Reply-To: <20230103215004.22646-7-agraf@csgraf.de>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 6 Jan 2023 17:13:34 -0700
Message-ID: <CAPnjgZ2Fgbt0q3DA51HiM0qezEXuT1CafXBEoWHwF6Qbq7eL8Q@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v4 6/9] video: Only dcache flush damaged
	lines
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
> Now that we have a damage area tells us which parts of the frame buffer
> actually need updating, let's only dcache flush those on video_sync()
> calls. With this optimization in place, frame buffer updates - especially
> on large screen such as 4k displays - speed up significantly.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: Da Xue <da@libre.computer>
>
> ---
>
> v1 -> v2:
>
>   - Fix dcache range; we were flushing too much before
>   - Remove ifdefs
>
> v3 -> v4:
>
>   - Simplify first damage logic
> ---
>  drivers/video/video-uclass.c | 45 +++++++++++++++++++++++++++++-------
>  1 file changed, 37 insertions(+), 8 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
