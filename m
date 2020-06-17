Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 755161FC487
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Jun 2020 05:12:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F2EDC36B11
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Jun 2020 03:12:43 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 203C1C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2020 03:12:40 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id g2so391339lfb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 20:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T1/uW0LRPful58KxE4+1AJw+JTRhsVVWHU1Fwb0ZpqM=;
 b=XkDYtzIf8Oxugc8jQLdrdR23KjjvqULEhHKbmb0ZFdOycY5BHiDe+VHle+23+Fw5Ac
 54cNzNVuI8DcC7uemcY0ZOfMNiACRrWBLSwNzUwO1Z5jg8OboL6axm1O4Iv8QtCGt0NU
 URpRpvYNHxaQy36q0EbVHQPWQDtDYw65MJk5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T1/uW0LRPful58KxE4+1AJw+JTRhsVVWHU1Fwb0ZpqM=;
 b=a50ApUBiI3MAkndebpcGs8BZZO9P2c7F9bZk0/rZsxFZD0mVI502zAmOYnlkotOQeB
 fXe9SEiEpzuyKqgeVFRbfX0mQYbnFIlyWIoOLds9etzrL8kLBEsgNqCgab+NCaTOjytM
 DVyeaqqryKkV4+0UrEiKuVwJi3WoBbOyvIGKZnlLS8lwgIN5mYcgo64izaR6HGkToRza
 gSYbhilBqU2F49DFNZw7biKnoPfKvMpEmLf9lrVVyBgLTYr6msgD4KJ17SgnA6Pzigt7
 jEw3Y0NjzvkONCA1xGv+pm+KY1+xli7rADzMVCgJorBgvlpRzdPx3kVG1cYsRltz4F55
 eJeg==
X-Gm-Message-State: AOAM533FqKvvcYlR1j9hzSS9foHJ1kaQnx+mBarQRAXzKo6fba4b3ayT
 b9XCO2CV3EtjWTXkSd1PVaMQ+1FEO8EfPkOUS97pUA==
X-Google-Smtp-Source: ABdhPJzpSb16OxfqeofzFXXjJ3bKVuNHadB5g3OTQVLgKV39cRPLLyiocmm5XxikH+IdDqWZY2CV55FFMy4D9IvbF2k=
X-Received: by 2002:ac2:5324:: with SMTP id f4mr3313791lfh.209.1592363559582; 
 Tue, 16 Jun 2020 20:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-6-patrick.delaunay@st.com>
In-Reply-To: <20200616074048.7898-6-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 16 Jun 2020 21:12:20 -0600
Message-ID: <CAPnjgZ0USzMorWud62q=1WGorv4Wc12qC+HEKKaATCq0MUV6PA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Mario Six <mario.six@gdsys.cc>
Subject: Re: [Uboot-stm32] [PATCH v2 5/9] sandbox: support the change of env
	location
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

On Tue, 16 Jun 2020 at 01:40, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Add support of environment location with a new sandbox command
> 'env_loc'.
>
> When the user change the environment location with the command
> 'env_loc <location>' the env is reinitialized and saved;
> the GD_FLG_ENV_DEFAULT flag is also updated.
>
> When the user set the same env location, the environment is
> re-loaded.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - change cmd_tbl_t to struct cmd_tbl
>
>  board/sandbox/sandbox.c | 42 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
