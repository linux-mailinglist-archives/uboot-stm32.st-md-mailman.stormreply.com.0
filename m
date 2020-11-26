Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1512C4DDF
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Nov 2020 04:52:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A866C424AF;
	Thu, 26 Nov 2020 03:52:42 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFE49C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Nov 2020 03:52:40 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id q5so516048qkc.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 19:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Dpcn6Xe7sli+E7cf8ratBmo19l4xCW1Xwn1kZzy1uYw=;
 b=oITLcLFmTS2BIrMf/4zS7FrbYKjEAzOLVKGVpp/roFSIaNcCKw8rP6SN4YRrFp4/Ax
 E2PkqYuyUznlFqpqULr75oroa9e5aPUyP8UirCbURcxCYKXxbIhLRxAGHqqdb9hFg95V
 9R36YprnYgVO+j56mGSofTgiKxSJ0FrOOtopo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dpcn6Xe7sli+E7cf8ratBmo19l4xCW1Xwn1kZzy1uYw=;
 b=uIl3skWCeGNk1UP4Yl5UBsOay3KqEkhg5JRn7b8cQc1hh7dsGCcnIgnWdtz5fyoBUh
 cKJHGkFcA7bEb83wG9amkGFejPJFCTaiG+d/Zy+/jEYT78ogpvHKuTbqVId4wTbUwO3s
 GiLT8yQM0868nir6Jy6cBbhHB+F22c3sIwY3tlNX4/frLgd031W5F2jMJnObUgsUXffe
 BJKoEahhyNYaXgiP1J2+sP6+VxX4M4Nrz8WXJMIsQDx/+QoSa154YR6TBLPg2Ulyy4GB
 KeGYumpArqsJ6m32AWgm5mOK8gNbFPWRqec5hcuykGd/GgcDTZv8Ov8GtiN2sEo/rHH7
 hiqA==
X-Gm-Message-State: AOAM532LNFLz5O5uOdUi1K4/aLitsSm4yVTyQDuFX5gSYZ+7HBbsHtN/
 yZIBROAPMhn4ay0qqRV+pMaUPA==
X-Google-Smtp-Source: ABdhPJzfF1mWQaIkavmD/azx8L5cMvOXtEau+W42/2u2/J0f9QRqnrK1BoaPgEEIN4MPx2zJW115yg==
X-Received: by 2002:a37:634d:: with SMTP id x74mr1342267qkb.478.1606362759687; 
 Wed, 25 Nov 2020 19:52:39 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-135-175.ec.res.rr.com.
 [65.184.135.175])
 by smtp.gmail.com with ESMTPSA id j21sm1491028qtp.10.2020.11.25.19.52.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Nov 2020 19:52:38 -0800 (PST)
Date: Wed, 25 Nov 2020 22:52:36 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20201126035236.GN32272@bill-the-cat>
References: <1606316102821.13856@st.com>
MIME-Version: 1.0
In-Reply-To: <1606316102821.13856@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Richard Genoud <richard.genoud@posteo.net>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master =
	u-boot-stm32-20201125
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
Content-Type: multipart/mixed; boundary="===============6014293002182983885=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6014293002182983885==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AMnfhCSTHOurdchq"
Content-Disposition: inline


--AMnfhCSTHOurdchq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 02:55:02PM +0000, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related patches for u-boot/master, v2021.01: u-boot=
-stm32-20201125
>=20
> - STM32 MCU's DT update
> - Add DHCOM based STM32MP15x PicoITX board
> - Correct ALIGN macro usage for on syram for SPL dcache support
> - Fixes on DHCOM: uSD card-detect GPIO and Drop QSPI CS2
> - Fix compilation issue for spl_mmc_boot_partition
> - Fix MTD partitions for serial boot
> - Add support of MCU HOLD BOOT with reset for stm32 remoteproc
>   (prepare alligneent with  kernel DT)
> - Correct bias information and support in STM32 soc and STMFX
> - Support optional vbus in usbphyc
> - Update FIT examples to avoid kernel zImage relocation before decompress=
ion
>=20
> CI status:=20
> https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/commits/u-boot-stm3=
2-20201125
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master https://gitlab.denx.de/u-boot/custodians/u=
-boot-stm.git u-boot-stm32-20201125
>=20
> The following changes since commit d361eafe82bfbf90ab0a592ae59daef99faee5=
ec:
>=20
>   Merge https://gitlab.denx.de/u-boot/custodians/u-boot-usb (2020-11-22 1=
1:00:11 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20201125
>=20
> for you to fetch changes up to 60a2dd6aa20f6c0938856b764e7ebdee722d998e:
>=20
>   board: st: stm32mp1: update load address for FIT examples (2020-11-25 1=
4:27:19 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--AMnfhCSTHOurdchq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+/JoAACgkQFHw5/5Y0
tywPdgv/c+ler+zvzyPQszLugMoPzBXQjShuk/PVJvjhrMUB1mjTpYTXv94J21nf
wszwBaXF2BbaIfrN05MM6+GthReY56uG2Hm73GheFZeBBgyrXiZlfkdt/Aq7HvOO
mMMiFM2iiOc3+gUIZjSuc/PZKaODqDZUMzYwSavnQlUV/MMFY0IN5WO2e4mRsTKy
6/+WBYAvdt0Eo++N/FSyE4B1k/H1ot5hujnfEwBh5LtgP8ktMuOK3adh8Mi/x9fc
kjhTQ09pn7dZx8PhJgd0vemAWTDATlzbc9Xkfekh1DrhsWueWu+8E8qrw7iIYiJP
s+MP4jGz7vx+T37qCmjsPq+oheEtJW2Oc1nLrCNbxpnV4xL2/Amw2PxXo156j7s2
tzdli4SRISd7U9Z1lM/MNS3DkntR7dX2ExeANfVlizpW8nezQ1epmwJYHgWMIRxg
xJuGsIHRKb99S8TVopWJuX9RkIa+qa9BycJqyRFGuM7ba1RUhxndmvUOU4h75avq
KVJ12oLo
=cG8J
-----END PGP SIGNATURE-----

--AMnfhCSTHOurdchq--

--===============6014293002182983885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6014293002182983885==--
