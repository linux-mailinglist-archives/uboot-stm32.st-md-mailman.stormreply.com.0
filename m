Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5072CC8CB
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 22:21:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAA22C424C0;
	Wed,  2 Dec 2020 21:21:51 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83EEEC424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 21:21:50 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id h20so185121qkk.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Dec 2020 13:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MhtO/uToUlJb7DT8zIDBepx7m/gaAqMciIPHSLdkuVg=;
 b=iedUiaZCGEg08IlxxttW32w1HSWPAN8Cxe+da+IMHb3xD9zYOAL1M3Rp3CjdM82aN5
 0ztVwmkL7FS8UOrhV/AoFm+ZOK/IcnsP6/5++rPszzQn2Wbt9Y4MTJS2aIZ0LDxFXaBS
 b15uPuvHbEBZSGNbYZzjUYujUKGLOwLYhpZOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MhtO/uToUlJb7DT8zIDBepx7m/gaAqMciIPHSLdkuVg=;
 b=VFepxwmD+CbVeUhTC3lUW0Qdug0+HXugM8pDnYcAAA+Ut0FHIjB7cZmbAr7GnzaJsz
 OuppRD+eJ1dGp9Kl+nLkxv5MXBESBWfubaA+IammeqQQCjxatGLtX9DJHONwEfdb5dDx
 tfBmwo15Kn53D+XlQF+51XscW4s7ebjPXErJFhehsCYN8SNEq+U8Y4wc9j6wFvxEow6E
 1avHIQCF6ZFHwaGqlHiy95Yqe1QcW8Ssl8ddlV2hLWaDVAVyuTzmAF+GQSgfJtqG1azd
 797iuuNVljEvmaSue478SevBrrNaMBI6XGKhLljjRggtFe5zX68uWQKKav+AkpXghykg
 jtzw==
X-Gm-Message-State: AOAM530VyVlkMY8DSE239LUgh9etRKYpz/kWjxjVPvGMMRL5Qyca32xm
 nn0U0N2k0j19z8oFmyaeWqNUog==
X-Google-Smtp-Source: ABdhPJzx9e+0xaF+0kSLsbe7UPPpe0cRdsQo+xBFKm38SFd6o1FlplZtazNshmGCO+bocQpMLZ4Qcg==
X-Received: by 2002:a37:6c81:: with SMTP id h123mr4768977qkc.160.1606944109562; 
 Wed, 02 Dec 2020 13:21:49 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-135-175.ec.res.rr.com.
 [65.184.135.175])
 by smtp.gmail.com with ESMTPSA id d140sm3110833qke.59.2020.12.02.13.21.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Dec 2020 13:21:48 -0800 (PST)
Date: Wed, 2 Dec 2020 16:21:46 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20201202212146.GN32272@bill-the-cat>
References: <20201026083142.6395-1-patrick.delaunay@st.com>
 <20201026083142.6395-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20201026083142.6395-2-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Philippe Reynes <philippe.reynes@softathome.com>,
 Holger Brunck <holger.brunck@ch.abb.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de,
 =?iso-8859-1?Q?Fr=E9d=E9ric?= Danis <frederic.danis@collabora.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Adam Ford <aford173@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] cmd: Kconfig: migrate
	CONFIG_SYS_PROMPT_HUSH_PS2
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
Content-Type: multipart/mixed; boundary="===============6243026844478098215=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6243026844478098215==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="517pCzpsiLFBzq6n"
Content-Disposition: inline


--517pCzpsiLFBzq6n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 09:31:42AM +0100, Patrick Delaunay wrote:

> Move CONFIG_SYS_PROMPT_HUSH_PS2 in Kconfig, depending
> on CONFIG_HUSH_PARSER, and remove the default value defined
> in cli_hush.c under __U_BOOT__.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/next, thanks!

--=20
Tom

--517pCzpsiLFBzq6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl/IBWoACgkQFHw5/5Y0
tyyiFQv+JH6+2YdEWlZ6LS/6j/lnzRHP+CH/NHK0l/UrP/EyvJR5Re30zgn4OPxE
bZIrFkWzT0Xkl3QJlp3i4AQpXLUePnBLsEZLqKIKpsaPYg+GukzGimzmNXSOdbg2
CasdwDGHF1lptZrGYzOD1K94Jdi+C/6Wz/VSKemhG/TzxE/JbGhg9jokzkbodjwv
qzoN0UP3bj3KMjH597bsC6Bofb6T6MCzFbjuagov6lJlx/rp+eVOZkeRph5N3YlJ
flsZ1sOKZV/sdhxFq0caPWHQ+fPW8f2M4VCFHub9WQYGth9EdX3CxGBvQHFn79nR
EG54ajpqNp1Q1hQQuuebFRTd/cZI+t4TYeSat8zO1f+d8mCb7sHZlTF+d+miHPWf
zJHMhxtIeg3UWWsYbcXHL3DHm/iZfcj0LdnRik42ondzF3K/2pOV8ptrNAWZ+bus
rz6/8xyWQ1JxqrN2OHdFvaqP3mynqDw58GoHmqiO8YtufM0Wb+R8SRkd4lSkoUuz
UocaqcTr
=dUPF
-----END PGP SIGNATURE-----

--517pCzpsiLFBzq6n--

--===============6243026844478098215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6243026844478098215==--
