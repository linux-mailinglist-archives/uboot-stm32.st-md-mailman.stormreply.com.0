Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO16O9fMwmkBmQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2026 18:41:44 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEA031A2E9
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2026 18:41:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE706C87ECB;
	Tue, 24 Mar 2026 17:41:42 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA965C87EC5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 17:41:41 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b886fc047d5so958033266b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 10:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774374101; cv=none;
 d=google.com; s=arc-20240605;
 b=jA6+DqOMSAFIUXVE5sxoJA7mafoBRGJcHMiWEVdhBbmcPYxcsWcHKUl8r7B9rLe1zG
 V0coGa7atdqOcIV44gQZM8wjRTEgIVCvTZIA5Vo1KS8Zl63jxHlQC54djAbLk3aNtYhH
 vEjsICoMW6W1wv6twGz9/iqYjR1OViXB8CfVLKwcGd9VdjeePm6B8ulgUQWrEgt4SpM4
 gAsKnVhebtqQ7O6HdoVw4IePVHx7GeBs9uNG23zsaoNwJ0SbNEo6VxgP92ueJqdUn0Ac
 PJ/AwK9xN6RX17FYTU0Lg2PHOQXDDZ1DNOuE2HKDAWmwLsv7gK7NOL3XJwy+5vq9oeBq
 hNzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=f1ottSAtczohD1NRXdvebbjd0FdcbbwAYgrYaA1gVbo=;
 fh=cu/gAmlMAza+KLoHycJJsJRV5SqjK32AVhegzZwLKiU=;
 b=Jpp3sf6KgtZkTxIZpm/7H8QWgWvukpc1tr62GDxAMQ15g9B8n4f1fUhOUMyV6nJY0P
 mW1ySzp+5rTZNwBWRuc3QsaWwEcMGYZS8zw2OVmZz7bdODb0TuT4K9pzJ1RIiLhqrBlo
 yfq3l5cnsPP34FSisrPJuiwRxZTFf8T2w4KlPENLM/FypFsQPC/wlv1+kawexfDK0Y4y
 WpjFDPeDD6ou/X5as/VcxaY58jxUW8/NRD1FjznNTmM4cMYo6lwFbBObmcuTPmIeor29
 fPvESbeCoMy/foxAU7as8ropDfrfejkJYA+GX9wHchFuQpoxV+y0OK2D2/SuyhDzOLif
 /2BQ==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1774374101; x=1774978901;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f1ottSAtczohD1NRXdvebbjd0FdcbbwAYgrYaA1gVbo=;
 b=hwVJvwahW4Q04+QqtGvHNl8y+f35Nrj+dLc+eeox9TdY/GAE7bf7HGccul3c1R1xhi
 QwiJ3VyvXqWPuqIQvJIPp9IWNp5/hIdsRJvJEhEiEUIn5lYtFjSBq6nI4R5O9pS1Tdc0
 KIJP1mLUvxA2S45x4XhtqYMgypkqv1ZjNi6uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774374101; x=1774978901;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f1ottSAtczohD1NRXdvebbjd0FdcbbwAYgrYaA1gVbo=;
 b=noM1fr+n1RdPCvdrBMDhiqKJLmjx4yzq/1jRNlsM6i4BCK1c9FZiiAULIPB84IUoqY
 BRL4nUHq6oMsV59IDue/TlDVQr0g6Ir8TPTkWSyHd6sU1C1lrJstQV7VZ49YaZk0Uc35
 fWWCCMrSbuZ5O1LB82hd5no0l7ejUPUOOQM++x9JY95j/HGbMuzAWRBz3oBfy2nZbGpa
 wlE7FKgLmC3+Z+vh6KGt1Og3zhVztd0twgUf4NcuIEpxWpnazG9gJf8XFV2dvRU41leg
 7eqMxKBC6jiPkvcZmXxgUuzRGJXZybnkFytSODsDeGUpozFxGtXv+23VxNb6rCoYCW7/
 sV9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeWEuJq/18raHA1rI47OUy3uUeqFNbfNe+THLSHEXuL0sgoPKmUdtD/UtY/5x8qZK0vUHvO95YRly73w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwHw6y8R/Nkk4TwjreJk2ZVC9d5L4olj3XVFVHGX4Jr9xY6cBsS
 YkBY9t1AZBCnFeDPHe1RsgSy9H76MQYMrqSgoJOCua3BObMLVYjhEN6x7aHSchRmXRNXtyLbZGH
 yRrze6W6Rif0KIm5T/njLCQ86OrajvxNK1qUXDdrj
X-Gm-Gg: ATEYQzxSRuOXF7rgbkeHEQ/F5J2AqOu+38tYvCz8nJm82Qhw5EQliH5CX+DHPfOp6ci
 YKTYgdHt4I7z6hmkQu9zZEh4GfBtfwF0+IurL6mRutZKk/occPniOdWqStepwmwU8jFdCx1dlPv
 sPMklzHFpK/3gOBBHrhQ22ElnsdtqoqmhlvtWnf+a++lDfv9qU43wjB4ZOCNUYR03VuLmRA1YyX
 taOSiO2TcQ2CJ0gAuqP3dLTEFO44MIZpHoKDUxuqh7Ys1l8qwIRayCOeUAyRe5ElRyZLkbB0nMl
 ofAecdM=
X-Received: by 2002:a17:907:e11c:b0:b99:7697:76dc with SMTP id
 a640c23a62f3a-b9a3f1663d8mr18984566b.4.1774374100786; Tue, 24 Mar 2026
 10:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260323225537.896180-1-trini@konsulko.com>
In-Reply-To: <20260323225537.896180-1-trini@konsulko.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 24 Mar 2026 11:41:30 -0600
X-Gm-Features: AQROBzDoBbiLnL-H8z3_ppKXN1rO1G4g0-_SU87GunPz7GS7SCrV8NIEQMmqpLQ
Message-ID: <CAFLszTjN7ZSkc0vfT_KmN9um+v=--RRyV5OzJSWVirOT2fZWMA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Peng Fan <peng.fan@nxp.com>, Casey Connolly <casey.connolly@linaro.org>,
 Stefan Roese <stefan.roese@mailbox.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, u-boot-qcom@groups.io,
 Jerome Forissier <jerome.forissier@arm.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, Peter Robinson <pbrobinson@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 =?UTF-8?Q?=C5=81ukasz_Majewski?= <lukma@nabladev.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Heiko Schocher <hs@nabladev.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 linux@analog.com, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Bin Meng <bmeng.cn@gmail.com>, Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] global: Correct duplicate U_BOOT_DRIVER
	entry names
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
Content-Type: multipart/mixed; boundary="===============7168145449926065689=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[chromium.org:s=google];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:trini@konsulko.com,m:peng.fan@nxp.com,m:casey.connolly@linaro.org,m:stefan.roese@mailbox.org,m:kever.yang@rock-chips.com,m:kojima.masahisa@socionext.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot-qcom@groups.io,m:jerome.forissier@arm.com,m:simon.k.r.goldschmidt@gmail.com,m:u-boot-amlogic@groups.io,m:jh80.chung@samsung.com,m:pbrobinson@gmail.com,m:treding@nvidia.com,m:marek.vasut+renesas@mailbox.org,m:tien.fong.chee@altera.com,m:lukma@nabladev.com,m:philipp.tomsich@vrull.eu,m:hs@nabladev.com,m:neil.armstrong@linaro.org,m:mbrugger@suse.com,m:clamor95@gmail.com,m:linux@analog.com,m:patrick.delaunay@foss.st.com,m:bmeng.cn@gmail.com,m:ag.dev.uboot@gmail.com,m:simonkrgoldschmidt@gmail.com,m:marek.vasut@mailbox.org,m:bmengcn@gmail.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.219];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sjg@chromium.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,linaro.org,mailbox.org,rock-chips.com,socionext.com,lists.denx.de,st-md-mailman.stormreply.com,groups.io,arm.com,gmail.com,samsung.com,nvidia.com,altera.com,nabladev.com,vrull.eu,suse.com,analog.com,foss.st.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 1AEA031A2E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============7168145449926065689==
Content-Type: multipart/alternative; boundary="000000000000f9ed3a064dc8a97e"

--000000000000f9ed3a064dc8a97e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Mar 2026 at 16:55, Tom Rini <trini@konsulko.com> wrote:
>
> The U_BOOT_DRIVER macro creates a list of drivers used at link time, and
> all entries here must be unique. This in turn means that all entries in
> the code should also be unique in order to not lead to build failures
> later with unexpected build combinations. Typically, the problem we have
> here is when a driver is obviously based on another driver and didn't
> update this particular field and so while the name field reflects
> something unique the linker entry itself is not. In a few places this
> provides a more suitable string name as well, however.
>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> Cc: Anatolij Gustschin <ag.dev.uboot@gmail.com>
> Cc: Bin Meng <bmeng.cn@gmail.com>
> Cc: Casey Connolly <casey.connolly@linaro.org>
> Cc: Heiko Schocher <hs@nabladev.com>
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Cc: Jerome Forissier <jerome.forissier@arm.com>
> Cc: Kever Yang <kever.yang@rock-chips.com>
> Cc: =C5=81ukasz Majewski <lukma@nabladev.com>
> Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Cc: Masahisa Kojima <kojima.masahisa@socionext.com>
> Cc: Matthias Brugger <mbrugger@suse.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Peter Robinson <pbrobinson@gmail.com>
> Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
> Cc: Stefan Roese <stefan.roese@mailbox.org>
> Cc: Svyatoslav Ryhel <clamor95@gmail.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Tien Fong Chee <tien.fong.chee@altera.com>
> Cc: u-boot-amlogic@groups.io
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> Cc: u-boot-qcom@groups.io
> Cc: linux@analog.com
> ---
>  arch/x86/cpu/broadwell/sdram.c             | 2 +-
>  arch/x86/cpu/ivybridge/early_me.c          | 2 +-
[..]

For x86:

Reviewed-by: Simon Glass <sjg@chromium.org>

--000000000000f9ed3a064dc8a97e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">On Mon, 23 Mar 2026 at 16:55, Tom Rini &lt;<a href=3D"mai=
lto:trini@konsulko.com" target=3D"_blank" rel=3D"noreferrer">trini@konsulko=
.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The U_BOOT_DRIVER macro creates a list of drivers used at link time, a=
nd<br>
&gt; all entries here must be unique. This in turn means that all entries i=
n<br>
&gt; the code should also be unique in order to not lead to build failures<=
br>
&gt; later with unexpected build combinations. Typically, the problem we ha=
ve<br>
&gt; here is when a driver is obviously based on another driver and didn&#3=
9;t<br>
&gt; update this particular field and so while the name field reflects<br>
&gt; something unique the linker entry itself is not. In a few places this<=
br>
&gt; provides a more suitable string name as well, however.<br>
&gt;<br>
&gt; Signed-off-by: Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com" targ=
et=3D"_blank" rel=3D"noreferrer">trini@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt; Cc: Anatolij Gustschin &lt;<a href=3D"mailto:ag.dev.uboot@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">ag.dev.uboot@gmail.com</a>&gt;<br>
&gt; Cc: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_blan=
k" rel=3D"noreferrer">bmeng.cn@gmail.com</a>&gt;<br>
&gt; Cc: Casey Connolly &lt;<a href=3D"mailto:casey.connolly@linaro.org" ta=
rget=3D"_blank" rel=3D"noreferrer">casey.connolly@linaro.org</a>&gt;<br>
&gt; Cc: Heiko Schocher &lt;<a href=3D"mailto:hs@nabladev.com" target=3D"_b=
lank" rel=3D"noreferrer">hs@nabladev.com</a>&gt;<br>
&gt; Cc: Jaehoon Chung &lt;<a href=3D"mailto:jh80.chung@samsung.com" target=
=3D"_blank" rel=3D"noreferrer">jh80.chung@samsung.com</a>&gt;<br>
&gt; Cc: Jerome Forissier &lt;<a href=3D"mailto:jerome.forissier@arm.com" t=
arget=3D"_blank" rel=3D"noreferrer">jerome.forissier@arm.com</a>&gt;<br>
&gt; Cc: Kever Yang &lt;<a href=3D"mailto:kever.yang@rock-chips.com" target=
=3D"_blank" rel=3D"noreferrer">kever.yang@rock-chips.com</a>&gt;<br>
&gt; Cc: =C5=81ukasz Majewski &lt;<a href=3D"mailto:lukma@nabladev.com" tar=
get=3D"_blank" rel=3D"noreferrer">lukma@nabladev.com</a>&gt;<br>
&gt; Cc: Marek Vasut &lt;<a href=3D"mailto:marek.vasut%2Brenesas@mailbox.or=
g" target=3D"_blank" rel=3D"noreferrer">marek.vasut+renesas@mailbox.org</a>=
&gt;<br>
&gt; Cc: Masahisa Kojima &lt;<a href=3D"mailto:kojima.masahisa@socionext.co=
m" target=3D"_blank" rel=3D"noreferrer">kojima.masahisa@socionext.com</a>&g=
t;<br>
&gt; Cc: Matthias Brugger &lt;<a href=3D"mailto:mbrugger@suse.com" target=
=3D"_blank" rel=3D"noreferrer">mbrugger@suse.com</a>&gt;<br>
&gt; Cc: Neil Armstrong &lt;<a href=3D"mailto:neil.armstrong@linaro.org" ta=
rget=3D"_blank" rel=3D"noreferrer">neil.armstrong@linaro.org</a>&gt;<br>
&gt; Cc: Patrice Chotard &lt;<a href=3D"mailto:patrice.chotard@foss.st.com"=
 target=3D"_blank" rel=3D"noreferrer">patrice.chotard@foss.st.com</a>&gt;<b=
r>
&gt; Cc: Patrick Delaunay &lt;<a href=3D"mailto:patrick.delaunay@foss.st.co=
m" target=3D"_blank" rel=3D"noreferrer">patrick.delaunay@foss.st.com</a>&gt=
;<br>
&gt; Cc: Peng Fan &lt;<a href=3D"mailto:peng.fan@nxp.com" target=3D"_blank"=
 rel=3D"noreferrer">peng.fan@nxp.com</a>&gt;<br>
&gt; Cc: Peter Robinson &lt;<a href=3D"mailto:pbrobinson@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">pbrobinson@gmail.com</a>&gt;<br>
&gt; Cc: Philipp Tomsich &lt;<a href=3D"mailto:philipp.tomsich@vrull.eu" ta=
rget=3D"_blank" rel=3D"noreferrer">philipp.tomsich@vrull.eu</a>&gt;<br>
&gt; Cc: Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org" target=3D"_bla=
nk" rel=3D"noreferrer">sjg@chromium.org</a>&gt;<br>
&gt; Cc: Simon Goldschmidt &lt;<a href=3D"mailto:simon.k.r.goldschmidt@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">simon.k.r.goldschmidt@gmail.com=
</a>&gt;<br>
&gt; Cc: Stefan Roese &lt;<a href=3D"mailto:stefan.roese@mailbox.org" targe=
t=3D"_blank" rel=3D"noreferrer">stefan.roese@mailbox.org</a>&gt;<br>
&gt; Cc: Svyatoslav Ryhel &lt;<a href=3D"mailto:clamor95@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">clamor95@gmail.com</a>&gt;<br>
&gt; Cc: Thierry Reding &lt;<a href=3D"mailto:treding@nvidia.com" target=3D=
"_blank" rel=3D"noreferrer">treding@nvidia.com</a>&gt;<br>
&gt; Cc: Tien Fong Chee &lt;<a href=3D"mailto:tien.fong.chee@altera.com" ta=
rget=3D"_blank" rel=3D"noreferrer">tien.fong.chee@altera.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:u-boot-amlogic@groups.io" target=3D"_blank" rel=
=3D"noreferrer">u-boot-amlogic@groups.io</a><br>
&gt; Cc: <a href=3D"mailto:uboot-stm32@st-md-mailman.stormreply.com" target=
=3D"_blank" rel=3D"noreferrer">uboot-stm32@st-md-mailman.stormreply.com</a>=
<br>
&gt; Cc: <a href=3D"mailto:u-boot-qcom@groups.io" target=3D"_blank" rel=3D"=
noreferrer">u-boot-qcom@groups.io</a><br>
&gt; Cc: <a href=3D"mailto:linux@analog.com" target=3D"_blank" rel=3D"noref=
errer">linux@analog.com</a><br>
&gt; ---<br>
&gt;=C2=A0 arch/x86/cpu/broadwell/sdram.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 arch/x86/cpu/ivybridge/early_me.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
[..]<br>
<br>
For x86:<br>
<br>
Reviewed-by: Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org" target=3D"=
_blank" rel=3D"noreferrer">sjg@chromium.org</a>&gt;<br></div>

--000000000000f9ed3a064dc8a97e--

--===============7168145449926065689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7168145449926065689==--
