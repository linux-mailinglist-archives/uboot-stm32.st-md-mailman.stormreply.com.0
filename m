Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA8WMC5jvWlF9gIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Mar 2026 16:09:34 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 558902DC5C5
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Mar 2026 16:09:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3CAAC87EBD;
	Fri, 20 Mar 2026 15:09:33 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EA41C35E2B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 15:09:32 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-67bac077116so230366eaf.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1774019371; x=1774624171;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vypP5FMiNTVA6057pEyRk0YVHq+tlwl/GSTFrXkkB30=;
 b=oQYtRzJiSKwMY918jOLGZYXJnLffp5Uf50AsLb11G3inBPetNPcFx46IHieY3C8kdm
 ZVTCk/TgvM+LCz2zbBkFISDFAdh2iAbl7joNW1Z4Fe7qitm2jNiewqD8zY7HOsCfQK23
 Mr1kez9jmVEEfgW2jMq2im4Sm1Q1fIR/d8BYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774019371; x=1774624171;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vypP5FMiNTVA6057pEyRk0YVHq+tlwl/GSTFrXkkB30=;
 b=Hai5vTBFedFIzu2d7jAM1Q2hiG85WJNW1ogZYlqpKAk6G6p4ggCdi5pooYN7pz5VzF
 BbANmIO7w2TqNGl798e9hUiNxbbMjwTgeCL4LJZUXpp2Oeuyr9+pSJQ6D21lWcKl9oWo
 lIqDuqbKPpIO+I7qeockav52qp74QcamRQcNkCFLaXhkyIfE2Fvjhfz0IGdzq4IJQs+T
 vm5Az79IA3Lw9HIZOq1s9YKkGLtQhVkypwvnQRzwcRw4q3jhLRzPmvnFMLl78xv8487d
 ipnKC/pUUaoa/l52cpCLvhmyhzWPBgSLuh0nNVFLCuzg8z1PUM6QWUHsLjXFNd//NuMi
 9pCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuxIqLr3HgaxRHv2wNoofiZtfbzLW339Sc615bFxPoe5p+GWbNF9yWK0BO/VxPCTrf4Z1DV3yn1AWn+Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw+b9+BG5UllgUkiFQNO/5HBWRXjLh9la8Fl7n4yKgWVt4WD7Oh
 2r2fyxkGkjGrk475gzmU0rmSNHnvqNE+m2J2Pltwxiqvc3fhLR7ABV6toPGsJTafvzc=
X-Gm-Gg: ATEYQzzFFGgYI3/nDdWDokFcnClaHuI3Smbr9ZZ6nnn54FDptE3hjWoV+OsJ/ymQOe8
 QtB/N3vAZW/1a0jOmtz3rybnCi6cZf6+wHfGZTeyJyHUrFG/6Ci9D44nLy99qycJOFwrKULV9nO
 OGP2zpbyvDmOX00RaIAMq/SQZH25B+JZHqFTW6uy3mKZFWYWvxkwc5mQbIiUWdjvS8VpVW2ygyF
 RQUZ+4Ns/0ZJrzgQx2/OLYErB56mAPO6Yki0ia38w3IO1FxA3ur7/ckgr/ZO+C1d3AHzC8rYVkc
 5fVRMOqKgwRJ7hYS8wcakkdHGr8MYMj7XBRwYhmok266yEv/FjrZpQM/3BK8XEJVZzYRFdeO+l6
 HYBUt1kyOjwNPQmVHqaPrnoDK58dxKAZjXGTLo49mYAVAQkoGZaRrLX5xw8sRTlQ9yYRF+PMaoq
 G9aLC9NdG2c/ofcaVw8RVt1/QT3zPXP/UdVW+UlnCdlffyoCSFl9aVopGCQ68tX/dOvI+nr3Rv+
 3eyo3K36XUUPNOlHcqIrdkKj2/2vDCmQX8b678y0plpboDM
X-Received: by 2002:a05:6820:62a:b0:67b:f4a3:b796 with SMTP id
 006d021491bc7-67c22f958e7mr2136599eaf.55.1774019370694; 
 Fri, 20 Mar 2026 08:09:30 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-235.totalplay.net.
 [189.203.97.235]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-67c251a58dfsm1277241eaf.0.2026.03.20.08.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:09:29 -0700 (PDT)
Date: Fri, 20 Mar 2026 09:09:27 -0600
From: Tom Rini <trini@konsulko.com>
To: Ferass El Hafidi <funderscore@postmarketos.org>
Message-ID: <20260320150927.GB502704@bill-the-cat>
References: <20260319-casey-ccf-upstream-v1-0-4df2ee2226da@linaro.org>
 <20260319-casey-ccf-upstream-v1-15-4df2ee2226da@linaro.org>
 <tc612f.1958x6s93grqj@postmarketos.org>
MIME-Version: 1.0
In-Reply-To: <tc612f.1958x6s93grqj@postmarketos.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Dai Okamura <okamura.dai@socionext.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Marek Vasut <marex@denx.de>,
 Casey Connolly <casey.connolly@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Paul Sajna <sajattack@postmarketos.org>, Lukasz Majewski <lukma@denx.de>,
 Paul Barker <paul@pbarker.dev>, linux@analog.com, u-boot-qcom@groups.io,
 u-boot@lists.denx.de, Joel Stanley <joel@jms.id.au>,
 uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>,
 uboot-snps-arc@synopsys.com,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH RFC 15/40] clk: restrict clk/imx to
	MACH_IMX
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
Content-Type: multipart/mixed; boundary="===============6260078041628421527=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [0.29 / 15.00];
	SIGNED_PGP(-2.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[konsulko.com:s=google];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[konsulko.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:funderscore@postmarketos.org,m:okamura.dai@socionext.com,m:BMC-SW@aspeedtech.com,m:u-boot-amlogic@groups.io,m:ilias.apalodimas@linaro.org,m:marex@denx.de,m:casey.connolly@linaro.org,m:swboyd@chromium.org,m:neil.armstrong@linaro.org,m:sajattack@postmarketos.org,m:lukma@denx.de,m:paul@pbarker.dev,m:linux@analog.com,m:u-boot-qcom@groups.io,m:u-boot@lists.denx.de,m:joel@jms.id.au,m:uboot-stm32@st-md-mailman.stormreply.com,m:sjg@chromium.org,m:uboot-snps-arc@synopsys.com,m:GSS_MTK_Uboot_upstream@mediatek.com,m:andrew.goodbody@linaro.org,m:sumit.garg@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[konsulko.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.683];
	TAGGED_RCPT(0.00)[uboot-stm32];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,groups.io:email,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 558902DC5C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--===============6260078041628421527==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NLjqDhp4BzK24ULp"
Content-Disposition: inline


--NLjqDhp4BzK24ULp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 09:25:14PM +0000, Ferass El Hafidi wrote:
> On Thu, 19 Mar 2026 20:56, "Casey Connolly via groups.io" <casey.connolly=
=3Dlinaro.org@groups.io> wrote:
> > Only build IMX clocks when MACH_IMX is enabled, otherwise IMX clock
> > drivers get compiled for all platforms with CLK_CCF enabled.
> >=20
> > Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> > ---
> > drivers/clk/Makefile | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index 5f0c0d8a5c28..f96d57a3223a 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -15,9 +15,9 @@ obj-$(CONFIG_$(PHASE_)CLK_STUB) +=3D clk-stub.o
> >=20
> > obj-y +=3D adi/
> > obj-y +=3D airoha/
> > obj-y +=3D analogbits/
> > -obj-y +=3D imx/
> > +obj-$(CONFIG_$(PHASE_)MACH_IMX) +=3D imx/
>=20
> I think this is not necessary. drivers/clk/imx/Makefile already requires
> that imx config options be enabled for the driver to be compiled in.

Almost all of them do. I see:
$ rg obj.*CLK_CCF drivers/clk/
drivers/clk/Makefile
10:obj-$(CONFIG_$(PHASE_)CLK_CCF) +=3D clk.o clk-divider.o clk-mux.o clk-ga=
te.o
11:obj-$(CONFIG_$(PHASE_)CLK_CCF) +=3D clk-fixed-factor.o
61:obj-$(CONFIG_SANDBOX_CLK_CCF) +=3D clk_sandbox_ccf.o

drivers/clk/exynos/Makefile
10:obj-$(CONFIG_$(PHASE_)CLK_CCF)       +=3D clk.o clk-pll.o

drivers/clk/imx/Makefile
5:obj-$(CONFIG_$(PHASE_)CLK_CCF) +=3D clk-gate2.o clk-pllv3.o clk-pfd.o

But exynos is guarded by CONFIG_CLK_EXYNOS to start with. So I think
this is right, and also something that could just be standalone and
picked up shortly as it's a build cleanup.

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--NLjqDhp4BzK24ULp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCab1jIwAKCRAr4qD1Cr/k
CjdCAQCgnFWFQ/O1pXOo/rj9vi9RzSILtD9BX3tunzOiyXst+QEA9c8UGn0xwevE
3kHJZ86ibblj5T9B/MJ/PecPqlx1Jgo=
=GY9m
-----END PGP SIGNATURE-----

--NLjqDhp4BzK24ULp--

--===============6260078041628421527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6260078041628421527==--
