Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC2FLzRWq2lRcQEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Fri, 06 Mar 2026 23:33:24 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A31E228562
	for <lists+uboot-stm32@lfdr.de>; Fri, 06 Mar 2026 23:33:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C743AC8F281;
	Fri,  6 Mar 2026 22:33:23 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D14C2C8F273
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2026 22:33:21 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-7d4c9537f90so6677267a34.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Mar 2026 14:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1772836400; x=1773441200;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d2oeBjJF2hUFSaB5rg0q6stK8Oa+SnM/8WFWy1TKplg=;
 b=k0wyaIQDrxiNJoSebaI29aY6xCZNPfZ56e2M5dRN8jOaQvboBH5Pd33q42KrtbfJYf
 EbPEwUJnyWp1czFRAkrGCFwFcFivu/hz0Oam0th2LKGW4qSjq3bUPmdpjGKqXaQDxepE
 +z5H4bzg1cDqQ7sFsS671tsh/v9pteUjInhSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772836400; x=1773441200;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d2oeBjJF2hUFSaB5rg0q6stK8Oa+SnM/8WFWy1TKplg=;
 b=MolllFhTNFlhFWE4I28dQzHMEhrzRHYyJ+7c3w/GMpsEOyNUHCKc66ZjcPvZ35vsnx
 lG3MFdRo+xbxm8/+840n6BcUmswkLszOz1FF/FNSB/prPhC3rO1y3z3C+gUzxfhplirO
 OBFifQU4TzwPgCq06sLBFv5+fCwR7T8VGvCBH+6sZOx5ooI0xKC458ZqNcD7Xlcn8KYt
 vtlJFIhFlivqkYQsUqdsO3zIhV0tI2hPMStFFc5p4NgxVHolQHbxFz6FYrbz2+93z7ZW
 KTA/dcJ5Cl6AsO63LxzO31YUUSsi8cHzNeRMZD3tTaDGU23FWSIHGXs1PIYQ9i4ppmW7
 faSQ==
X-Gm-Message-State: AOJu0Ywrs3MtUNc8y00UEVY3vzjWzT1mKSCrA3Rprt42CH1rP7Is1Hz2
 U87ORn2j88KMGdZ8x3zu94eLW95M/4HWdzcb+TAS6pnYUE5ll43bZ5TdiAf2BuW8j7g=
X-Gm-Gg: ATEYQzzDTDn0hn7Ca+yLAjra4hYBy4wfAFFjMOzdZIEsvORRS1K9N57Q1TEfpvDMR1W
 Wzispaw7qtyzGmgbkWPMhEDstvSho3SQMsavwrfDr0ty+RxtvRPq1qsbH62nBC470zur9Ksb0ez
 tLtyxy+qgz1/5KjUTSwbCaEy3zDiD/q5SrszVa5R4B41+w7We7Fe7ofuI+A3tpiQe8B//YyWrj1
 q+t6nqqdg/KH3x0aezm8ZVogyc2ZiY44+wBowFszw8SU80MX3btjiCzBHvQjzKlmlX+7oAaQuGi
 V0hud6VBt/urRKg9Av6/uTABs2K4zMKyFfuc+UfFPAjIjISCwHb2GC5q2nZVci2bXS4YYSyXfV5
 37/DM41NbWKWEU0k2EFJx75F/gTDjWt21ekzI5ZHIgHqawnJSQXSqAAavL8zvThGq4e3rcUFA6V
 JtuGlOmBXhOT57tT8J/oY90zCBSvkXsizD2xC8cIdB3Wwd9tGH8qIdLquDtbPcULjxJRMlrg6Ib
 spvpZro2QdrjcN6RVErSfJC0z4POzViuSoAuDnZ/IV82QwsfZQ=
X-Received: by 2002:a05:6830:620f:b0:7d1:9516:6858 with SMTP id
 46e09a7af769-7d72702d2a3mr2584454a34.24.1772836400499; 
 Fri, 06 Mar 2026 14:33:20 -0800 (PST)
Received: from bill-the-cat (fixed-189-203-103-235.totalplay.net.
 [189.203.103.235]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d728c5e182sm1717721a34.6.2026.03.06.14.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 14:33:19 -0800 (PST)
Date: Fri, 6 Mar 2026 16:33:17 -0600
From: Tom Rini <trini@konsulko.com>
To: =?iso-8859-1?Q?Rapha=EBl?= Gallais-Pou <rgallaispou@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20260306223317.GW1388590@bill-the-cat>
References: <20260205-dsi-v1-1-eb5805068e97@gmail.com>
 <50a9f6c3-4284-460c-a429-49b4a53c836e@foss.st.com>
 <beec85d9-a580-4ae3-854d-3c957b888eb2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <beec85d9-a580-4ae3-854d-3c957b888eb2@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: dsi: add .of_to_plat
	callback
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
Content-Type: multipart/mixed; boundary="===============5675041802286491858=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 2A31E228562
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.79 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[konsulko.com:s=google];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[konsulko.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rgallaispou@gmail.com,m:patrick.delaunay@foss.st.com,m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:ag.dev.uboot@gmail.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[konsulko.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.796];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[st-md-mailman.stormreply.com,lists.denx.de,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action


--===============5675041802286491858==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iT2IUXMr7v49cPNk"
Content-Disposition: inline


--iT2IUXMr7v49cPNk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2026 at 05:23:23PM +0100, Rapha=EBl Gallais-Pou wrote:
> Hi,
>=20
> Can this one be picked up for v2026.04 or is there something I should do ?

Patrick, Patrice, should I take this directly or is there some
objection? Thanks!

>=20
> Best regards,
> Rapha=EBl
>=20
> On 2/24/26 11:01, Patrick DELAUNAY wrote:
> > Hi,
> >=20
> > On 2/5/26 00:35, Raphael Gallais-Pou wrote:
> > > Drivers should extract device-tree data before probing via the
> > > .of_to_plat hook.
> > >=20
> > > Implement it for stm32_dsi driver.=A0 By doing so, it also solve a
> > > variable shadowing in stm32_dsi_probe() where &clk was used as
> > > peripheral clock and ref clock.
> > >=20
> > > For readability some struct have been renamed such as:
> > >=20
> > > =A0=A0 * struct stm32_dsi_priv *dsi -> struct stm32_dsi_priv *priv
> > > =A0=A0 * struct clk clk -> struct clk pclk
> > >=20
> > > Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> > > ---
> > > This patch has been tested on stm32mp157c-dk2 board.
> > > ---
> > > =A0 drivers/video/stm32/stm32_dsi.c | 168 +++++++++++++++++++++
> > > +------------------
> > > =A0 1 file changed, 91 insertions(+), 77 deletions(-)
> > >=20
> >=20
> >=20
> > Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> >=20
> > Thanks
> > Patrick
> >=20
>=20

--=20
Tom

--iT2IUXMr7v49cPNk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaatWLQAKCRAr4qD1Cr/k
CoE1AQD0QdtbMbeQWfGAyCvGDkTF+iCXaKP1cAdA53DFCj1ofwEA1lEsjeig/AbB
UE70mQCIWAkSqc+nzhAhi2ubd3bi5Aw=
=Q5ST
-----END PGP SIGNATURE-----

--iT2IUXMr7v49cPNk--

--===============5675041802286491858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5675041802286491858==--
