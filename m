Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA02F8A68
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 09:20:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC4D6C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 08:20:40 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30441C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Nov 2019 15:46:57 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id q7so1369255ybk.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 09 Nov 2019 07:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=smJg/Z/rP2pMe8Qq/A55un3fFbZECgu/YKEGEl+hR0Q=;
 b=RV778pEWjGiBXySzgs4Ibvr0wmLCJTJxOjU9rA8Tortu/2sPnOVNC2Ygs4lmQ9rw+O
 JFStSXIdk46rbg+EEDQU3yeIYQT7lyvGWwd7BmLY+Ag/8t79k40toVp0WAc76r3Y2YPE
 Bh/lju2dKHjqHnoiEPc4dw91tEDECIu5jPtFqqiv3VJLGWItGQWMtcmllAz17u3PJlfm
 X5AP9psy54HKLalHOu/jWdBFH6pozA2612BYGohiAZktTAtmJ9iANVjWcbD39QsTFNEF
 wCBKS9PVHx7gzBLcabaX/GvotjMaboz9op/mB3UsfSYBxe9hUHgmULe8G95C7u7+/H1h
 1aBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=smJg/Z/rP2pMe8Qq/A55un3fFbZECgu/YKEGEl+hR0Q=;
 b=ALjHow9FMgXj6q8GLPtkSEYhDIMv5V0tcsCUElD02wG1llJqmazbdK1JpzniCSkdC3
 3VbS+vEj/wF9BTSraqpeLELO5AmN2AeKtjlmfSGb7C/BfVrBfMlXG1LNkB2CTizUDTQC
 i+HQLmg5tI3dFXccBPVeGrwt1hHIz7QyJWsp2ZgokO7CDqLtDOHd9FCbQOgzic8s7w9l
 JMGJaLdoEP8rxwSJSx5zVRX2Y7E4ciWmSTcOO+AlUgHBvDAikMipSR6JWqu7ok6lo2Qp
 N8n42u1dLIrN6aw5jrUGVJ5CJk0kOGmHDMJkKgR5tbv5kJiyc+IS+TVBKTnBCmVLbwqJ
 bplg==
X-Gm-Message-State: APjAAAVkVurs+t9DIoyGdBGqQE6hYoMU98zPA/rhDCPfSKUeShw5m3lJ
 w/J9mNNRR0CWo7K7oFBAicOkpPot34iC+HB54HI=
X-Google-Smtp-Source: APXvYqz+FJ6g+/MKIMtSSQACrZShbZIcYJ6e9JpkLUMjQ3QHcdnONlgF5FEKjfo4ELnsjgg9qjhKL/Yim2zX3lClg9M=
X-Received: by 2002:a25:6c88:: with SMTP id
 h130mr14192481ybc.221.1573314415683; 
 Sat, 09 Nov 2019 07:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20191108144716.23829-1-patrick.delaunay@st.com>
 <507210dc-a047-8f33-873c-fb336e1f8ba0@denx.de>
 <CAAh8qsySU816FAqcjmvqsu_Rx6Yy-pk7yHHLsqkMhhrqsFPBzA@mail.gmail.com>
In-Reply-To: <CAAh8qsySU816FAqcjmvqsu_Rx6Yy-pk7yHHLsqkMhhrqsFPBzA@mail.gmail.com>
From: Patrick Delaunay <patrick.delaunay73@gmail.com>
Date: Sat, 9 Nov 2019 16:46:43 +0100
Message-ID: <CAKOfRZy664kidMXmXMk4ps_t-cU_25Ut-nxrL8NMm9F24CAAwQ@mail.gmail.com>
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
X-Mailman-Approved-At: Tue, 12 Nov 2019 08:20:39 +0000
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>, Sven Schwermer <sven@svenschwermer.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 0/4] usb: host: dwc2: use
 driver model for PHY and CLOCK
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
Content-Type: multipart/mixed; boundary="===============7351868229116141373=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============7351868229116141373==
Content-Type: multipart/alternative; boundary="000000000000ddec3f0596ebce7c"

--000000000000ddec3f0596ebce7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

My ci travis build is failing after the last updates (raspberry pi). I am
testing a update with sub for clk disable bulk function:

https://github.com/patrickdelaunay/u-boot/commit/1d053dd96e6623d02b84654398=
655a5563ccfdcb

Now buikd is ok:
https://travis-ci.org/patrickdelaunay/u-boot/builds/609496187

I will push it after the Week end (tuesday).

Sorry.

Patrick.



Le ven. 8 nov. 2019 =C3=A0 16:55, Simon Goldschmidt <
simon.k.r.goldschmidt@gmail.com> a =C3=A9crit :

> Marek Vasut <marex@denx.de> schrieb am Fr., 8. Nov. 2019, 16:46:
>
> > On 11/8/19 3:47 PM, Patrick Delaunay wrote:
> > >
> > > In this serie I update the DWC2 host driver to use the device tree
> > > information and the associated PHY and CLOCK drivers when they are
> > > available.
> >
> > I'm kinda on the fence whether to add it into current release or not.
> > The patches look generally OK to me.
> >
> > Ley, Simon, can you check this on SoCFPGA ?
> >
>
> Gmm, so can try, but I don't have a working setup with USB peripherals
> attached... I do have USB on the socrates, but currently no cable to
> connect anything...
>
> I could test it to see if I can get the same result saying no attached
> devices are found, that would mean probing still works correctly...
>
> Regards,
> Simon
>
> Bin, can you give it a once-over ?
> >
> > If this looks OK to you, I will add it.
> >
> > [...]
> >
> _______________________________________________
> U-Boot mailing list
> U-Boot@lists.denx.de
> https://lists.denx.de/listinfo/u-boot
>

--000000000000ddec3f0596ebce7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Marek,</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">My ci travis build is failing after the last updates (raspberry p=
i). I am testing a update with sub for clk disable bulk function:</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://github.com/pat=
rickdelaunay/u-boot/commit/1d053dd96e6623d02b84654398655a5563ccfdcb">https:=
//github.com/patrickdelaunay/u-boot/commit/1d053dd96e6623d02b84654398655a55=
63ccfdcb</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Now bui=
kd is ok:</div><div dir=3D"auto"><a href=3D"https://travis-ci.org/patrickde=
launay/u-boot/builds/609496187">https://travis-ci.org/patrickdelaunay/u-boo=
t/builds/609496187</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
 will push it after the Week end (tuesday).</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Sorry.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Patrick.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br><br><div=
 class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">L=
e ven. 8 nov. 2019 =C3=A0 16:55, Simon Goldschmidt &lt;<a href=3D"mailto:si=
mon.k.r.goldschmidt@gmail.com">simon.k.r.goldschmidt@gmail.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Marek Vasut &lt;<=
a href=3D"mailto:marex@denx.de" target=3D"_blank" rel=3D"noreferrer">marex@=
denx.de</a>&gt; schrieb am Fr., 8. Nov. 2019, 16:46:<br>
<br>
&gt; On 11/8/19 3:47 PM, Patrick Delaunay wrote:<br>
&gt; &gt;<br>
&gt; &gt; In this serie I update the DWC2 host driver to use the device tre=
e<br>
&gt; &gt; information and the associated PHY and CLOCK drivers when they ar=
e<br>
&gt; &gt; available.<br>
&gt;<br>
&gt; I&#39;m kinda on the fence whether to add it into current release or n=
ot.<br>
&gt; The patches look generally OK to me.<br>
&gt;<br>
&gt; Ley, Simon, can you check this on SoCFPGA ?<br>
&gt;<br>
<br>
Gmm, so can try, but I don&#39;t have a working setup with USB peripherals<=
br>
attached... I do have USB on the socrates, but currently no cable to<br>
connect anything...<br>
<br>
I could test it to see if I can get the same result saying no attached<br>
devices are found, that would mean probing still works correctly...<br>
<br>
Regards,<br>
Simon<br>
<br>
Bin, can you give it a once-over ?<br>
&gt;<br>
&gt; If this looks OK to you, I will add it.<br>
&gt;<br>
&gt; [...]<br>
&gt;<br>
_______________________________________________<br>
U-Boot mailing list<br>
<a href=3D"mailto:U-Boot@lists.denx.de" target=3D"_blank" rel=3D"noreferrer=
">U-Boot@lists.denx.de</a><br>
<a href=3D"https://lists.denx.de/listinfo/u-boot" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://lists.denx.de/listinfo/u-boot</a><br>
</blockquote></div></div></div>

--000000000000ddec3f0596ebce7c--

--===============7351868229116141373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7351868229116141373==--
