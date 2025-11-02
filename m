Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD14C2960A
	for <lists+uboot-stm32@lfdr.de>; Sun, 02 Nov 2025 20:54:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F384C628D5;
	Sun,  2 Nov 2025 19:54:18 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6A4DC628B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Nov 2025 19:54:16 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b7042e50899so633128766b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Nov 2025 11:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1762113256; x=1762718056;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4PVRcIFmA9mocovxQVI7ucuq5bG/LgvxBOkIpFyHJTo=;
 b=l3QnWZf4FH2ZB42UzxIMCCN/2aryJuDum3FnkaPWOVSCD8e/iftf1fFrOTJTLzS1WZ
 lKQQ++6m22/h5i3MBZnQsqAsbQtawi8rvgbqGraVpuPdRof53DAa2GXbiWRNVLPdI8ZW
 D3YjnKsHi4a6xPEHXD9+6hnF7bBg9b6mot/Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762113256; x=1762718056;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4PVRcIFmA9mocovxQVI7ucuq5bG/LgvxBOkIpFyHJTo=;
 b=tzn/a5tuG6kha7JxyNFeLiEp4a0a++NhJiCA/orURgxIl/xkQhJyWT/SYJKgGFFYRe
 cXfFvPDhhFSIVfZydJtmUUpQD7xC2ciMG1QqTFqQ4XV9cy1rav2wAoEiwb9OQbMSt+Fw
 uLjYA8AlFMvUunzkzYXPQXeRa9OkyubP1RxRKaApB+8OBKlPGABY0NjUF0Q2Cxvi8god
 PYDSxTsXGHEGT4W2K/d0IsJQyCxGzNkXHfO9OO4i4iSIrEiOKM2WUwWIQk5i3aBspmKL
 bmQuvUdPzdyr0dQuZGKOYzvBFJ+ivgJTbQly9eP3jckAg5OcjBHnFO0pVsGrIX3hhwa9
 QYpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlTY1rdSKvUY8tMnR/2SeUC+jYQoninV9Hxxx8A46AJT7UKTMPxzddDfi50O+DI4P9vmtV162ARW0dGw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzDUUdsTRLw95EYQVE2u1pcPOsYh1OM5ts1Xg4odWpanldPL9/G
 nO+XA4K+EhusA1WGkyyOyTY6Hh5vHuYijo8NhZUcKrcszdGUqblV+0FBUYtNgGw2bOt6C8pgsHY
 Mw1cvVY5Nn5dvBGzMnyGtiLN60R/9kB00AmVqV58U
X-Gm-Gg: ASbGnct0n7lngj+IudWxv5ZrwKkHhVRq4tzIEOzab9iEGNYakA5XD2uDSwyAzHwx1Ou
 6WondhM0bZyNFAGb1Ztt4dViqME3MBAf1fm/mi8MGgZV/Lv222vM0QPqK0sKklVNUfP9ejPspCr
 kQG81YP91MYbhA/fimpvtU9Y2l6pMf7stpOb/z2vcAWSFyApk++biXs1PaTj2XHS+PNOuPlWoZ1
 b0eXr4oxuHH6ArbtWErLQGCuZ1kSvelW7J0mCIrLkXYSPqICDLoPoTCCcnD4gzzaHnLwNbK
X-Google-Smtp-Source: AGHT+IGXUeTXGhjqYXW6Dunw0RJjkyTBKVQ0F5gU00AV/2lOOjF3YODRwRJLI4CeCvbd1yvD3AI/hwDHds2Yw2ImFz8=
X-Received: by 2002:a17:907:3da7:b0:b1d:285d:185d with SMTP id
 a640c23a62f3a-b706fe2d658mr1093432366b.0.1762113256075; Sun, 02 Nov 2025
 11:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-1-b42847884974@foss.st.com>
 <CAFLszTiT9iLx6gguhVui2Qh0Ew89yhvpDggKwPo71cB+Rv=xJA@mail.gmail.com>
 <aQavXq6jVagkIa53@thinkstation>
In-Reply-To: <aQavXq6jVagkIa53@thinkstation>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 2 Nov 2025 20:53:43 +0100
X-Gm-Features: AWmQ_blxBK7i8H7pxtavLpVYErx4InspOeRjgchXJTJe7SWrzcj70gU7RXDBI0M
Message-ID: <CAFLszThdV7cZ-uBXzqRYWv-HsGbNJV9BVKVOC4FQUD1yjZDNkg@mail.gmail.com>
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais=2DPou?= <rgallaispou@gmail.com>
Cc: Tom Rini <trini@konsulko.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
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
Content-Type: multipart/mixed; boundary="===============6117005655586322508=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============6117005655586322508==
Content-Type: multipart/alternative; boundary="000000000000aec2650642a1f6e0"

--000000000000aec2650642a1f6e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Raphael,

On Sun, 2 Nov 2025 at 02:10, Rapha=C3=ABl Gallais-Pou <rgallaispou@gmail.co=
m>
wrote:
>
> Le Sat, Nov 01, 2025 at 10:03:59AM +0100, Simon Glass a =C3=A9crit :
> > Hi Raphael,
> >
> > On Thu, 4 Sept 2025 at 14:53, Raphael Gallais-Pou
> > <raphael.gallais-pou@foss.st.com> wrote:
> > >
> > > The "Display Timings" in panel-common.yaml can be provided by 2
properties
> > > - panel-timing: when display panels are restricted to a single
resolution
> > >                 the "panel-timing" node expresses the required
timings.
> > > - display-timings: several resolutions with different timings are
supported
> > >                    with several timing subnode of "display-timings"
node
> > >
> > > This patch update the parsing function to handle this 2 possibility
> > > when index =3D 0.
> > >
> > > Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > > Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
> > > Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> > > ---
> > >  drivers/core/ofnode.c | 17 ++++++++++-------
> > >  1 file changed, 10 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
> > > index
e040e3f2806ffe74c58dcd82f36307351acd5a99..5a721b46e5a3214e7bd437739776362c2=
d22a3c9
100644
> > > --- a/drivers/core/ofnode.c
> > > +++ b/drivers/core/ofnode.c
> > > @@ -1221,13 +1221,16 @@ int ofnode_decode_display_timing(ofnode
parent, int index,
> > >         int ret =3D 0;
> > >
> > >         timings =3D ofnode_find_subnode(parent, "display-timings");
> > > -       if (!ofnode_valid(timings))
> > > -               return -EINVAL;
> > > -
> > > -       i =3D 0;
> > > -       ofnode_for_each_subnode(node, timings) {
> > > -               if (i++ =3D=3D index)
> > > -                       break;
> > > +       if (ofnode_valid(timings)) {
> > > +               i =3D 0;
> > > +               ofnode_for_each_subnode(node, timings) {
> > > +                       if (i++ =3D=3D index)
> > > +                               break;
> > > +               }
> > > +       } else {
> > > +               if (index !=3D 0)
> > > +                       return -EINVAL;
> > > +               node =3D ofnode_find_subnode(parent, "panel-timing");
> > >         }
> > >
> > >         if (!ofnode_valid(node))
> > >
> > > --
> > > 2.25.1
> > >
> >
> > Please add a test for this in test/dm/ofnode.c
>
> Hi Simon,
>
> I'll gladly do that, but I haven't write and use any test in U-Boot.  So
> it is a bit foggy how to implement it.

There is some info here:

https://docs.u-boot.org/en/latest/develop/testing.html

>
> Do we want to create a fake device-tree and test each configuration or
> do we want to test in the _current_ device-tree if timings are correctly
> set according to the index value ?

It looks like there is a 'display-timings' node in test.dts, with three
subnodes, so you should just be able to get an ofnode for that and then
read out one of them and check it.

Regards,
Simon

--000000000000aec2650642a1f6e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Raphael,<br>
<br>
On Sun, 2 Nov 2025 at 02:10, Rapha=C3=ABl Gallais-Pou &lt;<a href=3D"mailto=
:rgallaispou@gmail.com" target=3D"_blank" rel=3D"noreferrer">rgallaispou@gm=
ail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Le Sat, Nov 01, 2025 at 10:03:59AM +0100, Simon Glass a =C3=A9crit :<b=
r>
&gt; &gt; Hi Raphael,<br>
&gt; &gt;<br>
&gt; &gt; On Thu, 4 Sept 2025 at 14:53, Raphael Gallais-Pou<br>
&gt; &gt; &lt;<a href=3D"mailto:raphael.gallais-pou@foss.st.com" target=3D"=
_blank" rel=3D"noreferrer">raphael.gallais-pou@foss.st.com</a>&gt; wrote:<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The &quot;Display Timings&quot; in panel-common.yaml can be =
provided by 2 properties<br>
&gt; &gt; &gt; - panel-timing: when display panels are restricted to a sing=
le resolution<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0the &quot;panel-timing&quot; node expresses the required timings.<br>
&gt; &gt; &gt; - display-timings: several resolutions with different timing=
s are supported<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 with several timing subnode of &quot;display-timings&quot; node<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This patch update the parsing function to handle this 2 poss=
ibility<br>
&gt; &gt; &gt; when index =3D 0.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Reviewed-by: Patrice Chotard &lt;<a href=3D"mailto:patrice.c=
hotard@foss.st.com" target=3D"_blank" rel=3D"noreferrer">patrice.chotard@fo=
ss.st.com</a>&gt;<br>
&gt; &gt; &gt; Reviewed-by: Yannick Fertre &lt;<a href=3D"mailto:yannick.fe=
rtre@foss.st.com" target=3D"_blank" rel=3D"noreferrer">yannick.fertre@foss.=
st.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Raphael Gallais-Pou &lt;<a href=3D"mailto:rap=
hael.gallais-pou@foss.st.com" target=3D"_blank" rel=3D"noreferrer">raphael.=
gallais-pou@foss.st.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 drivers/core/ofnode.c | 17 ++++++++++-------<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 10 insertions(+), 7 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c<b=
r>
&gt; &gt; &gt; index e040e3f2806ffe74c58dcd82f36307351acd5a99..5a721b46e5a3=
214e7bd437739776362c2d22a3c9 100644<br>
&gt; &gt; &gt; --- a/drivers/core/ofnode.c<br>
&gt; &gt; &gt; +++ b/drivers/core/ofnode.c<br>
&gt; &gt; &gt; @@ -1221,13 +1221,16 @@ int ofnode_decode_display_timing(ofn=
ode parent, int index,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timings =3D ofnode_find_sub=
node(parent, &quot;display-timings&quot;);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ofnode_valid(timings))<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn -EINVAL;<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D 0;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ofnode_for_each_subnode(node, ti=
mings) {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
i++ =3D=3D index)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ofnode_valid(timings)) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =
=3D 0;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ofno=
de_for_each_subnode(node, timings) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if (i++ =3D=3D index)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
index !=3D 0)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node=
 =3D ofnode_find_subnode(parent, &quot;panel-timing&quot;);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ofnode_valid(node))<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.25.1<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Please add a test for this in test/dm/ofnode.c<br>
&gt;<br>
&gt; Hi Simon,<br>
&gt;<br>
&gt; I&#39;ll gladly do that, but I haven&#39;t write and use any test in U=
-Boot.=C2=A0 So<br>
&gt; it is a bit foggy how to implement it.<br>
<br>
There is some info here:<br>
<br>
<a href=3D"https://docs.u-boot.org/en/latest/develop/testing.html" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://docs.u-boot.org/en/latest/d=
evelop/testing.html</a><br>
<br>
&gt;<br>
&gt; Do we want to create a fake device-tree and test each configuration or=
<br>
&gt; do we want to test in the _current_ device-tree if timings are correct=
ly<br>
&gt; set according to the index value ?<br>
<br>
It looks like there is a &#39;display-timings&#39; node in test.dts, with t=
hree subnodes, so you should just be able to get an ofnode for that and the=
n read out one of them and check it.<br>
<br>
Regards,<br>
Simon<br></div>

--000000000000aec2650642a1f6e0--

--===============6117005655586322508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6117005655586322508==--
