Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 531F47BFFD7
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Oct 2023 16:57:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B319C6B442;
	Tue, 10 Oct 2023 14:57:57 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C06DFC65E4C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 14:57:55 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-9b1ebc80d0aso981549166b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696949875; x=1697554675;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/xYi/UoFLZktIk4JyrmyzNKbzCV9phF9qWayLQ8nc+Q=;
 b=VxPxSJA9LEwVIp6s/ZjSYay14d4zWQo5XrvclPiSrIrOzgjVTHj9/20Dv2lc0D3Eup
 DDhP5HQnCVNwUtjczgjeRu7RQTCccwzXHHseQQXrPKGROqha/44lNCeWpaUeh1NdQ8hA
 6ugTjcNOdJkMY8bpVkluTA6Xxnmd6A/P4Dq4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696949875; x=1697554675;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/xYi/UoFLZktIk4JyrmyzNKbzCV9phF9qWayLQ8nc+Q=;
 b=kJauOE81QE/Kt0/dPqBgpW70tgoXf5Mi9XhvFx2Jad4G3UG+/DCDxEhfaFvJdBpU2x
 cDFrbvkerHAKHzWacjJjB+vVrfPYEpDUmyUIedCSvlefeqaSj3Nb76Ntsv9IQW6y8cZe
 3BehfWJv4EsGr/xO9HsOVZ6y2MB1adCrdI1o4ds8ExjZRjLxc+9UymNEKzxRBb1mZnWd
 v/nYK1A49yDz+kioycDRXpS4JnytLqz+44VkqEhsItZjHE7EEYcZVxSMNsGtRB0t102t
 0JjER1bzo0dJfXqrheA5U33MyI7bzSzwhH7Up62bsblwxCHKXrpwY0dafXCv8fqxXoiI
 3acg==
X-Gm-Message-State: AOJu0YwzLEbD4fcinbRGaU6/6HI/igTA1F00+R9M0cZWR1q/ABPpxcHm
 e7pnXV8iAKSKK20KwRvudyU7WuZq+LZ7cYYHKbEmsQ==
X-Google-Smtp-Source: AGHT+IG0rZTqIZsI811Ro6nTAoyvwy8UjzuRw51saAhD7TB5mabTFFgWWwQ1z/MQb1Wxwwm/VKDmdjvrmp1gSDPT+38=
X-Received: by 2002:a17:906:1d:b0:9b2:9a0e:9972 with SMTP id
 29-20020a170906001d00b009b29a0e9972mr17160297eja.13.1696949875088; Tue, 10
 Oct 2023 07:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230924203953.1829820-1-sjg@chromium.org>
 <20230925003732.GN305624@bill-the-cat>
In-Reply-To: <20230925003732.GN305624@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 10 Oct 2023 08:57:44 -0600
Message-ID: <CAPnjgZ0ftGXFn+a_WeVSY4mSWzcRz0kEq-+n8i0Yv3yjFLjMxA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@denx.de>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Devarsh Thakkar <devarsht@ti.com>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Rick Chen <rick@andestech.com>, Joe Hershberger <joe.hershberger@ni.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Troy Kisky <troykiskyboundary@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Mark Kettenis <kettenis@openbsd.org>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Harald Seiler <hws@denx.de>, Alexey Romanov <avromanov@sberdevices.ru>,
 Michal Suchanek <msuchanek@suse.de>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Stephen Warren <swarren@wwwdotorg.org>, Safae Ouajih <souajih@baylibre.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Evgeny Bachinin <EABachinin@sberdevices.ru>, Stefano Babic <sbabic@denx.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Anatolij Gustschin <agust@denx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Tom Warren <twarren@nvidia.com>, Bin Meng <bmeng.cn@gmail.com>,
 Tobias Waldekranz <tobias@waldekranz.com>
Subject: Re: [Uboot-stm32] [PATCH 00/25] Tidy up use of CONFIG_CMDLINE
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
Content-Type: multipart/mixed; boundary="===============3744681885485044852=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============3744681885485044852==
Content-Type: multipart/alternative; boundary="00000000000082068f06075dee5b"

--00000000000082068f06075dee5b
Content-Type: text/plain; charset="UTF-8"

Hi Tom,

On Sun, 24 Sept 2023 at 18:37, Tom Rini <trini@konsulko.com> wrote:
>
> On Sun, Sep 24, 2023 at 02:39:18PM -0600, Simon Glass wrote:
>
> > It should be possible to disable CONFIG_CMDLINE and have all commands
> > and related functionality dropped from U-Boot. This is useful when
> > trying to reduce the size of U-Boot.
> >
> > Recent changes have stopped this from working.
> >
> > This series repairs the feature for sandbox and adds a test to stop it
> > breaking again.
> >
> > Note that quite a lot of functionality is lost of CONFIG_CMDLINE is
> > disabled, e.g. networking and most booting options. Further work is
> > needed to make the option more generally useful.
>
> I worry there's a lot of "make it compile, deal with it later" in here
> rather than unwinding so that $X works with CMDLINE disabled or we truly
> must have CMDLINE.  Perhaps it would be better to start with to take one
> of the platforms that enables say networking in SPL, where we
> functionally don't have a cmdline, and make that build with CMDLINE off.
> Having *PL build and link and work with CMDLINE disabled would possibly
> save some space too, which is always a good thing there.

So long as it gets us closer to the goal, I think the work is valuable.
Also it prevents additional regressions from creeping in, at least for
sandbox. I am under no illusions about how big an effort this is, but we
have to start somewhere. To me the easiest first step would be to decouple
bootm functionality from the bootm command. Likely that would be <40
patches.

Regards,
Simon

--00000000000082068f06075dee5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Tom,<br>
<br>
On Sun, 24 Sept 2023 at 18:37, Tom Rini &lt;<a href=3D"mailto:trini@konsulk=
o.com" target=3D"_blank" rel=3D"noreferrer">trini@konsulko.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; On Sun, Sep 24, 2023 at 02:39:18PM -0600, Simon Glass wrote:<br>
&gt;<br>
&gt; &gt; It should be possible to disable CONFIG_CMDLINE and have all comm=
ands<br>
&gt; &gt; and related functionality dropped from U-Boot. This is useful whe=
n<br>
&gt; &gt; trying to reduce the size of U-Boot.<br>
&gt; &gt;<br>
&gt; &gt; Recent changes have stopped this from working.<br>
&gt; &gt;<br>
&gt; &gt; This series repairs the feature for sandbox and adds a test to st=
op it<br>
&gt; &gt; breaking again.<br>
&gt; &gt;<br>
&gt; &gt; Note that quite a lot of functionality is lost of CONFIG_CMDLINE =
is<br>
&gt; &gt; disabled, e.g. networking and most booting options. Further work =
is<br>
&gt; &gt; needed to make the option more generally useful.<br>
&gt;<br>
&gt; I worry there&#39;s a lot of &quot;make it compile, deal with it later=
&quot; in here<br>
&gt; rather than unwinding so that $X works with CMDLINE disabled or we tru=
ly<br>
&gt; must have CMDLINE.=C2=A0 Perhaps it would be better to start with to t=
ake one<br>
&gt; of the platforms that enables say networking in SPL, where we<br>
&gt; functionally don&#39;t have a cmdline, and make that build with CMDLIN=
E off.<br>
&gt; Having *PL build and link and work with CMDLINE disabled would possibl=
y<br>
&gt; save some space too, which is always a good thing there.<br>
<br>
So long as it gets us closer to the goal, I think the work is valuable. Als=
o it prevents additional regressions from creeping in, at least for sandbox=
. I am under no illusions about how big an effort this is, but we have to s=
tart somewhere. To me the easiest first step would be to decouple bootm fun=
ctionality from the bootm command. Likely that would be &lt;40 patches.<br>
<br>
Regards,<br>
Simon<br></div>

--00000000000082068f06075dee5b--

--===============3744681885485044852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3744681885485044852==--
