Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81893C288FD
	for <lists+uboot-stm32@lfdr.de>; Sun, 02 Nov 2025 02:10:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28DC9C6046A;
	Sun,  2 Nov 2025 01:10:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67657C60467
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Nov 2025 01:10:00 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4298b865f84so1513140f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 01 Nov 2025 18:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762045800; x=1762650600;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YIdGNyJElwsPOOS0zRgIsevZAlH9JPDZcpI77KZwq9Y=;
 b=Xun/xCvgLUDwxcnEbBL7mwY0syJgPJl5/LeAuE5zso1IkyZ70WWrC8o7oJL5GVzl3V
 67OLGQoySc5e73vvtWUdJabe95QDbuREAUUODPgW3sUgSPkiNDzivyueZx0MWQz4CFil
 BuBg659a+GDzyIu6PpPDQ5JM6bdyBS7ZHT1Wg8H5ZcXzwkt4ZUoDDKYUR/3RIaNMWN5i
 iU2d0qhIaMWXST16DJqGGDr47DgP9JDsHhYrl1sRgDSboZs7f9KYb5/s5Xldue09DHPu
 VZOy5Q9DwQKvvETQcLAlfG8nxZWFrhxdjlCDpsbpm7CTitxp3azlNZfKfzkFL4uP1lp+
 oHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762045800; x=1762650600;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YIdGNyJElwsPOOS0zRgIsevZAlH9JPDZcpI77KZwq9Y=;
 b=qEKItIuCxFEpeVDCgfsxCDVpTu8AkvNw4ojbGV+BgcSdop1s0QafNTMz/kTaDPPRGV
 mzwQiDAGHj0eZPE432usKP1bk8g7xKSr2gIIZEYpnyqlaBWiYllfTKc77+CbPxDRrGT/
 rvrYUsZOFYbipvEiBFVtBj6yTnMLqxPFw/BYKNTPfVfrXGJ2Mpj5huMaf3jKbeZ3bdJa
 b89wvvYXSQdm08F+KnevIWhCXOs1EEkLk/VLRuu1bi9J1SB0u1+7DIQAXzmVMANu0Da6
 wIjoD/RprpCqqWOTZRy0XuWSS1SegIG+sLCKd5o6n8kjX5pL+dhY6G1Vy9yreazrtbpG
 JmxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+U2go8CxAZJ0tiP4zbH647Mg0cNgb98FAlEhOm72G/iU6W7QxFUa8HcjeSIFchBXvaTg6pl6ZpdxXlA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YytUE6ZtDcQ2ci5yP+A4Q+ZnQJC4rEHDDQdy1hrI2Zqh0ejxf+x
 ik6ZMbMEUKtFRatVFQDnaCfQH8ynmP1Jgxxrr0j8Etpem4ZljWK383Ri
X-Gm-Gg: ASbGncvDNkILPfz9YrdcTmmM5pYOhJ+29InxCjCT4EGztb55fMGnslcv76/eWKD9aYj
 7F7/7YseDViDBr8wWlVKctRaa8FFEV4lbvKT4f1MEkEI1LicYxo8vMYo/S0gRVmGLhHyigq6li/
 6ISqKYlCUKUBHAAK+ueOhtDCO+V4ICmKs01cV3zptSk+QHiffTBBcqXPuapH14L69fkcI7JSS2x
 kzagCUgAfX17X2dZdddlCRgz4VL0IdxbE1CsV+435UFv8HoE3YD3i9F1tYSyQnur3xZdhLoe4Mi
 kJEQNO8ezvIiDRTqUWLzY9JI8eht39m2LzPHJOUK9HH4oodD4gLT42wfC4N207bWLhp57d7L8LD
 H4200qZWtZ8LyuIa++hQvOaoTruck9h9QmzVva7nnZJqfqyFZvIlzrIdi174U0fVlt0zhUbBBUp
 tdGv+yzRuFzeo/
X-Google-Smtp-Source: AGHT+IEXVh03mHIPh+MWp0GP4XlnP+CDeoYMFJuqRScteYbXsDvJQPClQLJkyEd7lZgxLN103/Oq0g==
X-Received: by 2002:a05:6000:18a5:b0:427:a34:648c with SMTP id
 ffacd0b85a97d-429bd6efbbdmr7217481f8f.58.1762045799469; 
 Sat, 01 Nov 2025 18:09:59 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13e1d8bsm11717105f8f.25.2025.11.01.18.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Nov 2025 18:09:58 -0700 (PDT)
Date: Sun, 2 Nov 2025 02:09:50 +0100
From: =?iso-8859-1?Q?Rapha=EBl?= Gallais-Pou <rgallaispou@gmail.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <aQavXq6jVagkIa53@thinkstation>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-1-b42847884974@foss.st.com>
 <CAFLszTiT9iLx6gguhVui2Qh0Ew89yhvpDggKwPo71cB+Rv=xJA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLszTiT9iLx6gguhVui2Qh0Ew89yhvpDggKwPo71cB+Rv=xJA@mail.gmail.com>
Cc: Tom Rini <trini@konsulko.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>, u-boot@lists.denx.de,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sumit Garg <sumit.garg@kernel.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Dillon Min <dillon.minfei@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/7] ofnode: support panel-timings in
 ofnode_decode_display_timing
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Le Sat, Nov 01, 2025 at 10:03:59AM +0100, Simon Glass a =E9crit :
> Hi Raphael,
> =

> On Thu, 4 Sept 2025 at 14:53, Raphael Gallais-Pou
> <raphael.gallais-pou@foss.st.com> wrote:
> >
> > The "Display Timings" in panel-common.yaml can be provided by 2 propert=
ies
> > - panel-timing: when display panels are restricted to a single resoluti=
on
> >                 the "panel-timing" node expresses the required timings.
> > - display-timings: several resolutions with different timings are suppo=
rted
> >                    with several timing subnode of "display-timings" node
> >
> > This patch update the parsing function to handle this 2 possibility
> > when index =3D 0.
> >
> > Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
> > Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> > ---
> >  drivers/core/ofnode.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
> > index e040e3f2806ffe74c58dcd82f36307351acd5a99..5a721b46e5a3214e7bd4377=
39776362c2d22a3c9 100644
> > --- a/drivers/core/ofnode.c
> > +++ b/drivers/core/ofnode.c
> > @@ -1221,13 +1221,16 @@ int ofnode_decode_display_timing(ofnode parent,=
 int index,
> >         int ret =3D 0;
> >
> >         timings =3D ofnode_find_subnode(parent, "display-timings");
> > -       if (!ofnode_valid(timings))
> > -               return -EINVAL;
> > -
> > -       i =3D 0;
> > -       ofnode_for_each_subnode(node, timings) {
> > -               if (i++ =3D=3D index)
> > -                       break;
> > +       if (ofnode_valid(timings)) {
> > +               i =3D 0;
> > +               ofnode_for_each_subnode(node, timings) {
> > +                       if (i++ =3D=3D index)
> > +                               break;
> > +               }
> > +       } else {
> > +               if (index !=3D 0)
> > +                       return -EINVAL;
> > +               node =3D ofnode_find_subnode(parent, "panel-timing");
> >         }
> >
> >         if (!ofnode_valid(node))
> >
> > --
> > 2.25.1
> >
> =

> Please add a test for this in test/dm/ofnode.c

Hi Simon,

I'll gladly do that, but I haven't write and use any test in U-Boot.  So
it is a bit foggy how to implement it.

Do we want to create a fake device-tree and test each configuration or
do we want to test in the _current_ device-tree if timings are correctly
set according to the index value ?

Best regards,
Rapha=EBl

> =

> Regards,
> Simon
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
