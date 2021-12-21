Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B16947BFBB
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Dec 2021 13:32:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DFA2C5E2C4;
	Tue, 21 Dec 2021 12:32:07 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62B57C5E2C3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Dec 2021 12:32:05 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id 30so23323797uag.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Dec 2021 04:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M+Irlh/WHwyhXQvbW4Brz6uCAKYa7ItoEOiumo2Pbp8=;
 b=gwYlxImklTn/AqwTclW2+IQC2jr6A7QRZbxhLg21dVw9Pe+1VRykWK30yXKr8gZdZ6
 L67N3fMtpz1r3MjjZVI/UUmC5K41FR8S5Qg/BWOcwFGJrFL9qXGpMzeGoBUkkJUxzUjB
 Y7rYzUlBscGQxjF/+lpspggohhn6m13U+MuDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M+Irlh/WHwyhXQvbW4Brz6uCAKYa7ItoEOiumo2Pbp8=;
 b=OM36fhZlQGm9Tlcxxv9J2m22Pcw9HwmP5e4/RIA8K19+6d4ZBQlkWCjTjycEjliTAJ
 P61AFlU69ohWK+iF3okf8RRLmaAPXW2krW5TjIkkrK08yK5UTLb+wDWTmcfupNSYuPRI
 GOwxw4k0BOF854l7h4XcFM8tEcygztSbAFPx8fRkkZ04u2ZFq9BMgq00qbhBuzjZ17FM
 RXd7JH3OFKTSeqJf4OT5hbAyVWpLSz68sKjb2FXo8fc9+9jaj5dGm/krmbHk7CaHqw39
 cx0PCBRqiW6MXZ8pgssVDjc010hC0yoOJif9phvJUNIp+TbfXRrOsBn5MO344Q1Xrjs7
 Qtgw==
X-Gm-Message-State: AOAM5313dgHIVHkEEIDudX9QCwZgBiVbYT3opp9x5bMF5CbsLvAGPWfC
 Fus7svtWaf2zo5cbpaS9yj/ot3N1k5+02LrRd0k0hg==
X-Google-Smtp-Source: ABdhPJzvvs7Nmcw08ug3rHnX/X5N+cJZ2+PEHh2vFYp4uHnK3+4Tto9FprJenNSoN10oVYtC2DSz8ZjRLwR4k3wdeEE=
X-Received: by 2002:ab0:4465:: with SMTP id m92mr1160504uam.47.1640089923911; 
 Tue, 21 Dec 2021 04:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20211218150805.1083645-1-sjg@chromium.org>
 <20211218150805.1083645-3-sjg@chromium.org>
 <f2c32018-7708-6384-fe59-c1d45846d866@gmail.com>
In-Reply-To: <f2c32018-7708-6384-fe59-c1d45846d866@gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Dec 2021 16:31:51 +0400
Message-ID: <CAPnjgZ0XmZ6u88iCJw1pXhpwD+HW+uziRtVAz_is8psK75F_rA@mail.gmail.com>
To: Sean Anderson <seanga2@gmail.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rick Chen <rick@andestech.com>,
 Chin-Liang See <clsee@altera.com>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Wolfgang Denk <wd@denx.de>,
 Ran Wang <ran.wang_1@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Stefan Roese <sr@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Govindaraji Sivanantham <Govindaraji.Sivanantham@in.bosch.com>,
 Tom Rini <trini@konsulko.com>, Vladimir Oltean <olteanv@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>, Marek Vasut <marek.vasut@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 Wasim Khan <wasim.khan@nxp.com>, Heiko Schocher <hs@denx.de>,
 Wolfgang Grandegger <wg@aries-embedded.de>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>,
 Purna Chandra Mandal <purna.mandal@microchip.com>,
 Vitaly Andrianov <vitalya@ti.com>,
 Hiremath Gireesh <Gireesh.Hiremath@in.bosch.com>,
 Igor Grinberg <grinberg@compulab.co.il>,
 Aswath Govindraju <a-govindraju@ti.com>,
 Sandeep Sheriker M <sandeep.sheriker@microchip.com>,
 Olaf Mandel <o.mandel@menlosystems.com>, Anatolij Gustschin <agust@denx.de>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Joe Hershberger <joe.hershberger@ni.com>, Pavel Machek <pavel@denx.de>,
 Dave Gerlach <d-gerlach@ti.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Andrew F. Davis" <afd@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Walle <michael@walle.cc>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alban Bedel <alban.bedel@aerq.com>, Priyanka Jain <priyanka.jain@nxp.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Dalon Westergreen <dwesterg@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] Convert CONFIG_TIMESTAMP to Kconfig
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
Content-Type: multipart/mixed; boundary="===============0989981799486500128=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============0989981799486500128==
Content-Type: multipart/alternative; boundary="00000000000050fb1705d3a731b1"

--00000000000050fb1705d3a731b1
Content-Type: text/plain; charset="UTF-8"

Hi Sean,

On Sat, 18 Dec 2021 at 08:16, Sean Anderson <seanga2@gmail.com> wrote:
>
> On 12/18/21 10:08 AM, Simon Glass wrote:
> > This converts the following to Kconfig:
> >     CONFIG_TIMESTAMP
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
>
> [...]
>
> > diff --git a/net/Kconfig b/net/Kconfig
> > index 3d3329912da..1983506bb8e 100644
> > --- a/net/Kconfig
> > +++ b/net/Kconfig
> > @@ -109,6 +109,7 @@ config KEEP_SERVERADDR
> >
> >   config UDP_CHECKSUM
> >       bool "Check the UDP checksum"
> > +     default y if SANDBOX
> >       help
> >         Enable this to verify the checksum on UDP packets. If the
checksum
> >         is wrong then the packet is discussed and an error is shown,
like
>
> Should this hunk be part of the previous patch?

Yes, it should. I will fix it when I send another version.

Regards,
Simon

--00000000000050fb1705d3a731b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Sean,<br>
<br>
On Sat, 18 Dec 2021 at 08:16, Sean Anderson &lt;<a href=3D"mailto:seanga2@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">seanga2@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; On 12/18/21 10:08 AM, Simon Glass wrote:<br>
&gt; &gt; This converts the following to Kconfig:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0CONFIG_TIMESTAMP<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org=
" target=3D"_blank" rel=3D"noreferrer">sjg@chromium.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt;<br>
&gt; [...]<br>
&gt;<br>
&gt; &gt; diff --git a/net/Kconfig b/net/Kconfig<br>
&gt; &gt; index 3d3329912da..1983506bb8e 100644<br>
&gt; &gt; --- a/net/Kconfig<br>
&gt; &gt; +++ b/net/Kconfig<br>
&gt; &gt; @@ -109,6 +109,7 @@ config KEEP_SERVERADDR<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0config UDP_CHECKSUM<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Check the UDP checksum&quot;=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0default y if SANDBOX<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable this to verify the checks=
um on UDP packets. If the checksum<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is wrong then the packet is disc=
ussed and an error is shown, like<br>
&gt;<br>
&gt; Should this hunk be part of the previous patch?<br>
<br>
Yes, it should. I will fix it when I send another version.<br>
<br>
Regards,<br>
Simon<br></div>

--00000000000050fb1705d3a731b1--

--===============0989981799486500128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0989981799486500128==--
