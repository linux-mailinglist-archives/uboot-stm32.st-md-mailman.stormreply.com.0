Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1DE2C8EC6
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Nov 2020 21:13:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D3E2C424BF;
	Mon, 30 Nov 2020 20:13:14 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B48EC424BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 20:13:12 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id e105so559298ote.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Nov 2020 12:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ugs+t/rzzBmZ8gJCHEK1KJb9Ylibmi2j0dQq9PCia7w=;
 b=Oeg9+VkWKReo09U/WJPTm5nRwn7fyKl4jT/Ubv7hPFZmOkRIBYEwdpUbxFVw8HHwQj
 KSxwwp1MPC6tqiahST4ykw+yqchuZ9TH9hv/SBvSu4viNdkoTgsi6rQjgh8/BbOsfNjS
 opCk4Iv+XA1cS5lfP8xggQ2ZTb5ouZOnhnMmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ugs+t/rzzBmZ8gJCHEK1KJb9Ylibmi2j0dQq9PCia7w=;
 b=owEktRgPdN/M/DmhZ2+86RN1EepBD4v1fKFzcGKfS0eGUjzYQCYk1MEPjyFiGGggI8
 1e++jrqbLhBL3KqAcopCAl8BWiA0q4fA6TEtepHTEhr1iKXAvaUnKugDyXNCIbEjY+Zn
 cWTgKb8RbYcZIHbMNP2XvujRfcccnlpEAKKJBXB7Hmel/AH+Vb4/2FyswN7ZUkSHvCuR
 ytdCbB7Vq8Pj1Iz24kwSOaoxH8FZrPkkrPFY2fR9H53krzdmYto4PWlNnsgyCDhTCJ0s
 RVOwpV0NbVufZBrHP5W2EUfa7tVmSIjJtuXjOFCdhiTAJt8o6Jka8rNYDeufe22OkO/Z
 3a6w==
X-Gm-Message-State: AOAM533ojYjFQTjk44l7Eor7qCmHBnkRwhOCOaFwKg4E3qOlZ3nqZK0E
 Jw/BwWASVZVXneefjg8g+rMidldXgEBcKIWPr4kM3gMSMY0hPg==
X-Google-Smtp-Source: ABdhPJzoR3qyJ+Z+YQKM/VDvFa8wC/n7wlbH3Pk1CmM9zAKu+s9B2xlACVNXD8oyUOrevrqbUDiv3gzXSd4apJF4/T0=
X-Received: by 2002:a05:6830:12d0:: with SMTP id
 a16mr18322446otq.88.1606767190597; 
 Mon, 30 Nov 2020 12:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-3-patrick.delaunay@st.com>
 <19fede5c-166c-1cff-643d-d80cbff6c34b@gmail.com>
In-Reply-To: <19fede5c-166c-1cff-643d-d80cbff6c34b@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 30 Nov 2020 13:12:21 -0700
Message-ID: <CAPnjgZ1DFPcW4_b0bEVjE--0nc0xrHVGNxgNttyBnv7kTO8y4Q@mail.gmail.com>
To: Sean Anderson <seanga2@gmail.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 2/9] log: don't build the trace buffer
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

Hi Sean,

On Fri, 27 Nov 2020 at 07:50, Sean Anderson <seanga2@gmail.com> wrote:
>
> On 11/27/20 5:20 AM, Patrick Delaunay wrote:
> > Update _log function to drop any traces when log is yet initialized:
> > vsnprintf is no more executed in this case.
> >
> > This patch allows to reduce the cost for the dropped early debug trace.
> >
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > (no changes since v1)
> >
> >   common/log.c | 13 ++++++++-----
> >   1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/common/log.c b/common/log.c
> > index ce39918e04..212789d6b3 100644
> > --- a/common/log.c
> > +++ b/common/log.c
> > @@ -228,6 +228,9 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
> >       struct log_rec rec;
> >       va_list args;
> >
> > +     if (!gd)
> > +             return -ENOSYS;
>
> How early are you expecting this function to get called? AFAIK this will
> only return true before board_init_f_init_reserve. Shouldn't functions
> that early just not call log in the first place?

Heinrich may have some thoughts here.

I think we will end up using log very early, since it is sort-of the
replacement for printf() and debug().

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
