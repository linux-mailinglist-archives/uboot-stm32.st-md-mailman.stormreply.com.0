Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D523F5A6B3
	for <lists+uboot-stm32@lfdr.de>; Sat, 29 Jun 2019 00:07:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85CE4C36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2019 22:07:52 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3F4DC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 22:07:50 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id d15so6205262qkl.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 15:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RH2ZHf/rXr8ESyOdgMb0/B+SCCHhpZa4r++0Em3hOcg=;
 b=k1a7k4XhmGLX7FhdHvHJEJACnxy4wmJ9yZynB2HcrfZK3PRVAEbsAIlVA/FrCvezju
 C+LA98RnHFVh3KTIjDVNG+eQbXC5C5k6j86n9zfnfEzD/wZ3Ggp4SD9pAUWhTRnXtwTu
 VwakTnSaZMPV8MCoCJdZDcXrkBpI3vbyWzEOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RH2ZHf/rXr8ESyOdgMb0/B+SCCHhpZa4r++0Em3hOcg=;
 b=Gm4n0520yYwjfaeErcHbjlBdCuffLgu80WdAvGwKIbK9JSgo4I817064zFETA22A4s
 9bqwdH9Nhlw2AtrRXh8AT2VhNd2lcX1WNtduHEgV73D3cXM1taHlhwJqOn5h0kIUA/KO
 HxtDpAVbZi6C5QoJ6D538QqpejsPZrvR6Aj40o918tfwjtuL+hoIC4tgu0OiWJOxf/vV
 GoSWJZ3d5orb5QlabZyKI4qXT5nFlIGgT3AUH+yclhKSfKIjnIQ1SwG4ls+CtOPhg3yH
 dpA1/2vL+YFdB1eYHTogWQzOufJF0u+ap/i9RSra1Wy0GJwN8pxrMCoGfleQkzIpMp5i
 5Mlw==
X-Gm-Message-State: APjAAAWUyi397jSHFbFT3Th/03AvF0+PfASxs2bJAUyG9JTaOowIx8ye
 aKEXUVPIWWpqPwZnBKCjgs/rxFAxhwqHoA==
X-Google-Smtp-Source: APXvYqwhKwFl3MhvqAzp8ivyfxiNCGgaAUiM7N5DV0Rj2iUYNbth+AtAikQyamvSt0qjegqHCZrwpw==
X-Received: by 2002:a37:9506:: with SMTP id x6mr10979165qkd.107.1561759669644; 
 Fri, 28 Jun 2019 15:07:49 -0700 (PDT)
Received: from bill-the-cat
 (cpe-2606-A000-1401-82DE-7518-DB81-3504-840B.dyn6.twc.com.
 [2606:a000:1401:82de:7518:db81:3504:840b])
 by smtp.gmail.com with ESMTPSA id c55sm1675922qtk.53.2019.06.28.15.07.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 15:07:48 -0700 (PDT)
Date: Fri, 28 Jun 2019 18:07:45 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice CHOTARD <patrice.chotard@st.com>
Message-ID: <20190628220745.GW9388@bill-the-cat>
References: <9aaf14ab-a667-2ac4-0586-a57f82fd4a89@st.com>
MIME-Version: 1.0
In-Reply-To: <9aaf14ab-a667-2ac4-0586-a57f82fd4a89@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32]
 =?utf-8?q?=5BU-Boot=5D=5BPULL=5D_u-boot-stm32_for_v?=
 =?utf-8?b?MjAxOS4wN+KAiyAocm91bmQgNyk=?=
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
Content-Type: multipart/mixed; boundary="===============3711081787457383607=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3711081787457383607==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IPwq7vKbcnUIujWQ"
Content-Disposition: inline


--IPwq7vKbcnUIujWQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 08:09:58AM +0000, Patrice CHOTARD wrote:

> Hi Tom
>=20
> The following changes since commit 5eea874b5e989e62519824ad140aa086432d01=
ee:
>=20
> =A0 Merge https://gitlab.denx.de/u-boot/custodians/u-boot-x86 (2019-06-22=
 12:09:33 -0400)
>=20
> are available in the Git repository at:
>=20
> =A0 https://gitlab.denx.de/u-boot/custodians/u-boot-stm tags/u-boot-stm32=
-20190628
>=20
> for you to fetch changes up to 36cb793b35333e9a281445313de6db1ca4a6ab3a:
>=20
> =A0 mach-stm32: Fix MPU region size dedicated to SDRAM for STM32F4 (2019-=
06-28 09:45:27 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--IPwq7vKbcnUIujWQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdFo+xAAoJEIf59jXTHXZSq70P/1nmDKQndLx3N2+RFG6gyu/l
t9ejXIUEpdGcDlH2O81EmHL7s+FIENgfaaQSHARtNqWAy9t2fZ36sIDDTvn3ufAh
M49oJUCK8m0N65KTsWnoMlyNSwC5fQjChc82L8L05aflbaLR+AcHQRjmnlGit5re
lhaXQul/t3VrzSe+3ayWoHq/JMfT88up8MZxG2EWOK9xFv+SKvMEcGoC8ZpUXQNx
xlz1G9tWo2igp0RUKP2fflD7CehJoAFC+K2UYWDV9N73Nr1OZ2ubfvuoYftko/mW
yX1GQII7skyZz3pn6OVBXeIjvEwqCNJ0q5ir0QRJuelYYhOw1v/NCX2c7F5MbSmL
RRQOS18n8idMFvlocQTRQ2oEAe8X511mcyk2n0+t/2xbtHM5+x95Jx6JSgQt6lpN
EcBvnQ0Na+Fsjj1v1DPqsLPorHYObLhidUZmaBVXV194p+DfVDgRLmOC3KD6vPbU
1Vg/tz/K265yD6N5rj11BJGJLY56Zl0Zam/qqOvsodDHXOdTnnyWpfewb8UJhdCR
DUZ9caHfzOar7x8ezKkW+wK+QcKPWowAx6/+RxEYanVY9ysSutRsMQju04ebdPnK
adTgJugo3y5++IJuBposUnwKAAQmJzyi+TZgS7qHb8IBBsiDRd02hcoRgzsg4Yon
rIBxAQUfQp9UyQ9g8VvF
=S0lw
-----END PGP SIGNATURE-----

--IPwq7vKbcnUIujWQ--

--===============3711081787457383607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3711081787457383607==--
