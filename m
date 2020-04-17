Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FC61AE73B
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:08:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D09AAC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:08:07 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B905C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:08:06 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 71so3187184qtc.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bFglUyqmNXXAf/c7HMsRLe+Yb2lBGGV2W8IcQ6JLN8w=;
 b=MNjf5fzsqRxBoAz6IbTDPeSS1uhfywOU22XGBnrh8uymWzxpWizZEo0LbPVlWhSGV+
 wQ2g0PvSvDAT1SFQJ85nCMvtC9Zbw20VbVAR6jBwNk0y+4ksvovqfyT1JU7YE98kgZ7/
 IyO+p4SUIrcdaOtVbdzov0+BO+zfsQ0F9vaeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bFglUyqmNXXAf/c7HMsRLe+Yb2lBGGV2W8IcQ6JLN8w=;
 b=J2OhDwHBp4b12JUoiGWk3DsnT/kGCvSFlV/aIy23BnCcnO60n5VMAujUAJOTWE6zJn
 GKyHzhha61kOD2P20fBXrWhIZD0pJixqJNKpX5CSUZldqmGyzdDgC/H2svYj7RT+ded1
 1QfSRyabfbmzP2rmI2uCEx91GOKLojcV/kscLb09PToGi/2MMAeQ3XfbPZMnag8yqQcB
 tbx4dCx/AUSCXbUVtMf0xdJ9/kK8yzUlo7vOqBLly/s2BugdzQVmVurgPqLhaCQyY3u/
 c4QMI842LI/mWMA4kDwyOsP1qMQ1Ks9wKkQVYFx8berQ1BgvLUBynrb+lLiN41v1b+L2
 tL/w==
X-Gm-Message-State: AGi0PuZHSl7/dbM10DCUMccB11Dab63hR+yhBgfFaKwRNOL0TTUX51uy
 VaP260c1hLxmQ97FQVXjUh+1BA==
X-Google-Smtp-Source: APiQypImaQTI+A41cZeVKj9ETuio9+PEAd90WbekKS1zbqtTyN0kzCl+TxgTZL7OC9UuM5Bv1Il6EA==
X-Received: by 2002:aed:3e87:: with SMTP id n7mr5185241qtf.301.1587157684937; 
 Fri, 17 Apr 2020 14:08:04 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id m126sm5803668qkf.68.2020.04.17.14.08.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:08:04 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:08:00 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210800.GE4555@bill-the-cat>
References: <20200228141816.1644-1-patrick.delaunay@st.com>
 <20200228141816.1644-4-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200228141816.1644-4-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Peng Fan <peng.fan@nxp.com>,
 Eddy =?utf-8?B?UGV0cmnImW9y?= <eddy.petrisor@gmail.com>,
 Adrian Alonso <adrian.alonso@nxp.com>,
 "Albert ARIBAUD \(3ADEV\)" <albert.aribaud@3adev.fr>, u-boot@lists.denx.de,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, Ken Lin <Ken.Lin@advantech.com.tw>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Richard Hu <richard.hu@technexion.com>,
 Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ian Ray <ian.ray@ge.com>, Stefano Babic <sbabic@denx.de>,
 Jason Liu <jason.hui.liu@nxp.com>, Heiko Schocher <hs@denx.de>,
 Ye Li <ye.li@nxp.com>, Otavio Salvador <otavio@ossystems.com.br>,
 Alison Wang <alison.wang@nxp.com>, Troy Kisky <troy.kisky@boundarydevices.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Akshay Bhat <akshaybhat@timesys.com>,
 Markus Niebel <Markus.Niebel@tq-group.com>,
 Olaf Mandel <o.mandel@menlosystems.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH 3/7] doc: update reference to
	README.imximage
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
Content-Type: multipart/mixed; boundary="===============4173428176616920568=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4173428176616920568==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ca0/yK2c6QcOc1Rp"
Content-Disposition: inline


--Ca0/yK2c6QcOc1Rp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 03:18:12PM +0100, Patrick Delaunay wrote:

> Update reference in many files detected by
> scripts/documentation-file-ref-check
>=20
> README.imximage =3D> imx/mkimage/imximage.txt
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--Ca0/yK2c6QcOc1Rp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGrAACgkQFHw5/5Y0
tyx+vAwAtGP82wcnHZi7Vxsw3aeo/3f0GtVbKaTauAP2Lxm4p9p7GATyzEDd6HTx
5rjLQwa+3F8xI3cWRbekbz1vYGidMA5eE0d2JNxo6TqxG9p4FVQkI34q8v6TQRSk
F4HYuJDhAZHANE80GRk3JXJ0p2dhp3O85yijdByjEm05/ArZH+MIYdIOBprK6ONO
MmQwPjLo+UOmf8ltOJkQ/89MLQb7ET0AF8zrdjV1+q7wqtYf0K5E3zM+WlVsBG2u
duf4CsRp+eshI0oJv9rElatxeNPD9VQMEqOr/+Tz176y9xZz1PqMJTNvTzZh/m7T
uIXrZfo2BdfJJeabfKoO+ZJgo6u8ptFxnp5Loe2eMFJdLQfjxpr91jXsOuORAqzX
Z94QXTMdoH3bNeorrOrzjonQqfSZrTv6Ev2EAVyH2jARjWzr11JAsubzWvlLgAAF
SipoE8cyq+O4x4/GfU1/i3ixTH9ofSS1YFawlwvOFTHUaIz30bczudOqIJHDZEOI
hTCyRDX2
=npBc
-----END PGP SIGNATURE-----

--Ca0/yK2c6QcOc1Rp--

--===============4173428176616920568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4173428176616920568==--
