Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMvyFMWmwmkyggQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2026 15:59:17 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E044E30AA04
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2026 15:59:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80B7EC87EC8;
	Tue, 24 Mar 2026 14:59:16 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 750A3C1A97C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 14:59:15 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-7d77b179b52so991190a34.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 07:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1774364354; x=1774969154;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Kltq/UHaD/wPopTvCXbE3VL6aLVmgprbNTi1kf4pPUw=;
 b=gs1B1sn7N72nXAhms3ekJH3pFroN+RrWM2RvM6snoGJQAss6xjlm8EEeB9hDkf7xmo
 Q/JM3/8WMFB6IamCC1woNqNRfBmwPAV9rELn/d0F08vV2uC+0Zarer9Ms8Ahlz/HxYCl
 lBqpl9LPN7G9qpoHmd3MjX4kDrHBrdpibnmZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774364354; x=1774969154;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kltq/UHaD/wPopTvCXbE3VL6aLVmgprbNTi1kf4pPUw=;
 b=A85JLoLt7WTuD40JAc90xWRG/aJghQug4267C41Z5LrtQ2/njAZtxSl8Td6/1zFqDt
 2vX1m1XLHDW+uG14nK15gFqcnuz0dCJixDjiOZ4JgdgQH+DMMN1etpHrVxq+2/mjKFuo
 JhBmmnOkbScb7MFfYrAMKPtCNMjcbbXZH4bpZybqkW0XC4mprQh9bTzRPE8wfJ8iOtMN
 yX+Djby7iqQiaLWzkKRdddoxBGPbHXAhAYIzqEC1KaciF25O2q4+3/t5qT7x0UroAeTg
 Lt6uUpfMvtjfXDrbSkW2Y8mqgqfc4VxahiMxOSBrQU6Er1b6r1pKGkJgL+GJZ98woHst
 tbCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Y7dsLbkm9m2grCLzA0oJv+Ad/VTbw98nLN0QAA6va/78VgTDQWwuBNXsPwxgoe1Ioko0n65yZex9Xg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz/FY5ua1qB2D1fyacQCIlTu59HVUhHJoJXynrMI5reKOAW/qjX
 ct3SwswDcKqQlxevLVx9Yyzp9hxKSj08zUnr8ciyJ+hMoUmh56RPmJxc2dcYjBX0YEQ=
X-Gm-Gg: ATEYQzwPnKzMhzrZAlsVv8nJoWv1lJ77ICx2WjaQw8HHzEag2i978V5kcsuzqkgu9j4
 bt5AokSb621f/LPCba20ZtKyiUVID5bsv9vF91VqIeTOIvvRHYRPvDmezWQ4yLde3Lu2cGaL21x
 tEIimmKtbXyzpNoOslG0jav3LS4G4QkFpmhKK3jno/cNOpEFCk9RMV1Ptyd7zU4rv9yJ9Ryoi9p
 +nzvYoFhYFP2ChxjvLSBy4wNLIkdncu4++2kWSkXNdGzepLOM9ACK04wqewYYaDq4cA3YTtYbq0
 0SIgAHkvQH9LOya93Kv3yAQQYUgxlXImJCOkiPaCtO3i3ogLem33RGofMtKD4Jqa0cM/ekgdVKU
 GWh54d9j32pTjuGPELtgxKKjMcGZx+3UyYcqyjtvqwcp/Ay8I1Q6rkVkSiYEODfom4pLBB8cFy6
 boiu/KdP2/VngOABI6w/kBzBwAyEfM3IEskuY8PfmMzGxu15R9DrM8w8MWsUJ3ob7jRzoHSJSLT
 RtnwuH5ozH0OZoKD73TDlIxkGaG6d8Jkh4BhPEtTu/2qDpp
X-Received: by 2002:a05:6830:f97:b0:7d9:c783:5cc0 with SMTP id
 46e09a7af769-7d9c7835cfemr1947958a34.33.1774364354030; 
 Tue, 24 Mar 2026 07:59:14 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-235.totalplay.net.
 [189.203.97.235]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d7eadd17d9sm13368818a34.14.2026.03.24.07.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 07:59:13 -0700 (PDT)
Date: Tue, 24 Mar 2026 08:59:10 -0600
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Message-ID: <20260324145910.GP502704@bill-the-cat>
References: <20260323225537.896180-1-trini@konsulko.com>
 <ef7c8db3-0df8-4d32-983f-4b2dd81b298e@mailbox.org>
MIME-Version: 1.0
In-Reply-To: <ef7c8db3-0df8-4d32-983f-4b2dd81b298e@mailbox.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>, Casey Connolly <casey.connolly@linaro.org>,
 Stefan Roese <stefan.roese@mailbox.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot-qcom@groups.io,
 Jerome Forissier <jerome.forissier@arm.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>, Peter Robinson <pbrobinson@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 =?utf-8?Q?=C5=81ukasz?= Majewski <lukma@nabladev.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Heiko Schocher <hs@nabladev.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, linux@analog.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0265874972482307540=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [1.79 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[konsulko.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[konsulko.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:peng.fan@nxp.com,m:casey.connolly@linaro.org,m:stefan.roese@mailbox.org,m:kever.yang@rock-chips.com,m:kojima.masahisa@socionext.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot-qcom@groups.io,m:jerome.forissier@arm.com,m:simon.k.r.goldschmidt@gmail.com,m:u-boot-amlogic@groups.io,m:jh80.chung@samsung.com,m:pbrobinson@gmail.com,m:treding@nvidia.com,m:marek.vasut+renesas@mailbox.org,m:tien.fong.chee@altera.com,m:lukma@nabladev.com,m:philipp.tomsich@vrull.eu,m:hs@nabladev.com,m:neil.armstrong@linaro.org,m:mbrugger@suse.com,m:sjg@chromium.org,m:clamor95@gmail.com,m:linux@analog.com,m:patrick.delaunay@foss.st.com,m:bmeng.cn@gmail.com,m:ag.dev.uboot@gmail.com,m:simonkrgoldschmidt@gmail.com,m:bmengcn@gmail.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,linaro.org,mailbox.org,rock-chips.com,socionext.com,lists.denx.de,st-md-mailman.stormreply.com,groups.io,arm.com,gmail.com,samsung.com,nvidia.com,altera.com,nabladev.com,vrull.eu,suse.com,chromium.org,analog.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.650];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[konsulko.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E044E30AA04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============0265874972482307540==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MvxPhYR2QUvihehD"
Content-Disposition: inline


--MvxPhYR2QUvihehD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 12:28:13AM +0100, Marek Vasut wrote:
>=20
> [...]
>=20
> > diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3=
-meson-g12a.c
> > index 41d15996e5b2..49e9c3fa0e99 100644
> > --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> > +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> > @@ -533,7 +533,7 @@ static const struct udevice_id dwc3_meson_g12a_ids[=
] =3D {
> >   	{ }
> >   };
> > -U_BOOT_DRIVER(dwc3_generic_wrapper) =3D {
> > +U_BOOT_DRIVER(dwc3_meson_g12a) =3D {
>=20
> Could you please add usb_ as a prefix in front those usb drivers ?

As we talked about on IRC a bit, globally we're not consistent with
prefix or suffix or nothing. Your suggestion of a new macro that takes
the uclass name and rest of the driver name and constructs U_BOOT_DRIVER
=66rom that sounds great and would be a good general improvement. If you
can file an issue about it please I'll try and find some time to look in
to doing that.

--=20
Tom

--MvxPhYR2QUvihehD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCacKmugAKCRAr4qD1Cr/k
CmpyAQCuN4p26T/REii2QoFiw0+VYKRzKAkpxhJdroMVZggDdAEA6sQoSKo9eVVD
YEQJqehffXAcWEV/EoPeILkWOYavEgU=
=m20y
-----END PGP SIGNATURE-----

--MvxPhYR2QUvihehD--

--===============0265874972482307540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0265874972482307540==--
