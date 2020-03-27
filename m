Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07188195E85
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Mar 2020 20:21:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0740C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Mar 2020 19:21:09 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F278CC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2020 19:21:07 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id ef12so3436477qvb.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2020 12:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/v96m0sxwONc21yPuQNX/5KyExPdWEizhIgkFo6ELcQ=;
 b=YjrSZzxvBxruU8/2/I9/VOM2QgxYNWMNPN3FKPYm2c0eQ2Jd8ha+5RnERDoFUoqYVi
 xd34YYGTI4lfIQjMLrw4I/tg82Kt5bTsEEDzkFYGVQTh7fvG34fB2FmmVcv2UCuxSnWN
 AxP3hFUPRZFWXF6YZm0I0bqej/ScmbDf+cg9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/v96m0sxwONc21yPuQNX/5KyExPdWEizhIgkFo6ELcQ=;
 b=L3Tv/WIUXv3nXuC8asEOr9WcXf0TT8d4In3KBJhSfl8L/PSO2jPSSB5x+e4oIrDcMU
 EbLks/t3Vh9sab1PO2S3PjPXJiurIxU2TSTb6F58aEXL2uNzgqINUzxfUxwJSjbOBGWE
 bRGdkddSuVgIy13UmaPNEuyb2h7xrdoF1mWXFGbXfgMkKu+udRf05VqsuZuiPvMt85kz
 JSiFLFj4uKvwLJMhF5TzGCDAERA0umk7RoI820QZbueNPGUAMyGy547Ox2zgcsrgbEqo
 +1tZXhXYzX5KSS1jOSC9gpjH+ZzqirtPn/UrfGxnFvPN+oslAiMaMdcHgycl+mJ6Zo3P
 4SBQ==
X-Gm-Message-State: ANhLgQ3zfZJ4t7sCcWXh1C0uU3GHfnhQzA/zljU9RjUCefwPWFSDaPID
 Wp9LXj6/vEz+KIuMkuX+bKbSWQ==
X-Google-Smtp-Source: ADFU+vsI0z0TQjz+DeIZK1wTFQf/NeZq5AkdYhyYu8GDmkIqPZEWEi3wWiaRNeLlnjcWzORAVwsdCg==
X-Received: by 2002:ad4:4f34:: with SMTP id fc20mr781843qvb.137.1585336866002; 
 Fri, 27 Mar 2020 12:21:06 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-1905-9b98-4743-d05f.inf6.spectrum.com.
 [2606:a000:1401:826f:1905:9b98:4743:d05f])
 by smtp.gmail.com with ESMTPSA id p65sm4287555qke.42.2020.03.27.12.21.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Mar 2020 12:21:04 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:21:02 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>, Simon Glass <sjg@chromium.org>
Message-ID: <20200327192102.GA26969@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 00/21] dm: add support of new binding
 in gpio and pincontrol
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
Content-Type: multipart/mixed; boundary="===============5161172246443154305=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5161172246443154305==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:34:54AM +0100, Patrick Delaunay wrote:

> Hi,
>=20
> it is the V3 of "dm: add support of new binding in gpio and pincontrol"
> http://patchwork.ozlabs.org/project/uboot/list/?series=3D145044
>=20
> I rebase on v2020.01 and made some minor update after Simon Glass review.
> And I also split the previous patch was part of v2 08/14 to help review
> 	http://patchwork.ozlabs.org/patch/1200865/
> 	"gpio: add ops for configuration with dir flags"
>=20
> I create this patchset to prepare alignment of stm32mp157c-ev1
> device-tree with the linux kernel v5.4.
>=20
> One node for touch screen support use the IRQ line configuration
> using the new kernel binding introduced by the linux kernel
> commit ede033e1e863c from v5.1 ('dt-bindings:
> gpio: document the new pull-up/pull-down flags')
> https://github.com/torvalds/linux/commit/ede033e1e863c
>=20
> gt9147: goodix_ts@5d {
> 	compatible =3D "goodix,gt9147";
> 	reg =3D <0x5d>;
> 	status =3D "okay";
> 	irq-gpios =3D <&stmfx_pinctrl 14
> 			(GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
> 	irq-flags =3D <IRQ_TYPE_EDGE_RISING>;
> };
>=20
> In Linux Kernel, the GPIO configuration (pull down/up) are now
> managed by GPIO lib but they are not yet supported by U-boot in
> uclass GPIO or pincontrol (when used by gpio-hog).
>=20
> This serie adds the support of theses new defines (with ops
> get_config/set_config) added in kernel GPIO binding and adds
> the test in sandbox.
>=20
> NB: In a second phase, the removed set_open_drain/get_open_drain
>     API could be replaced by the new ops get_config/set_config.
>=20
> I also align the gpio binding file with the version from the
> latest kernel v5.3 (I don't think I remove any U-Boot specific
> part with this patch)
> I move the added information on gpio hog code in a new file
> doc/README.gpio.
>=20
> To have functional test, I convert pinctrl-generic to
> livetree otherwise the pins are not correctly configured in
> sandbox, when CONFIG_OF_LIVE is activated.
>=20
> For the test on gpio I add information for pin configuration in
> output of the command "pinmux status" with a simple pincontrol
> driver associated to GPIO driver.
>=20
> NB: after rebase on master branch, the sandbox test "ut dm power_domain"
>    is failing; it was not the case for v2019.10.
>=20
> ------------------------------------------------------ Captured stdout ca=
ll -------------------------------------------------------
> =3D> ut dm power_domain
> Test: dm_test_power_domain: power-domain.c
> ../test/dm/test-main.c:72, dm_test_destroy(): 0 =3D=3D uclass_destroy(uc)=
: Expected 0x0 (0), got 0xffffffea (-22)
> ../test/dm/test-main.c:107, dm_do_test(): 0 =3D=3D dm_test_destroy(uts): =
Expected 0x0 (0), got 0x1 (1)
> ../test/dm/test-main.c:169, dm_test_main(): 0 =3D=3D dm_do_test(uts, test=
, 1): Expected 0x0 (0), got 0x1 (1)
> =3D>
>=20
> I think it is linked to commit 52edfed65de9 ("dm: core:
> device: switch off power domain after device removal")
>=20
> After some investigation :
>=20
> 1/ pincontrol is remove in uclass_destroy(0)
>=20
> 2/ power domain is removed in uclass_destroy(0)
>=20
> 3/ device_chld_unbind()
> dev_power_domain_off
> -> probe power domain (again)
> --> pinctrl_select_state() in device_probe()
> ---> pincontrol is probed (again)
>=20
> 4/ at the end of  dev_power_domain_off() function the power domain
>    is unbind in dev_power_domain_off
>    device_remove(pd.dev, DM_REMOVE_NORMAL);
>=20
> So power domain driver is correctly removed but it is not the
> case for the pincontrol driver and that cause the issue.
>=20
> The problem occurs after my serie only because I introduce
> a second pincontrol driver for sandbox, so the dynamic changes
> but my serie is not the root cause of the issue.
>=20
> Workaround to allow test execution:
>   "dm: core: device: don't probe pinctrl for power domain"

Simon, any idea on how to fix the test failure above?  I don't think
excluding the test is the right path forward.  Thanks!

--=20
Tom

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl5+UhcACgkQFHw5/5Y0
tyyenQv/TqKo+v16wZ0vq0kG/GRlPlXlIQB5Pazh/wpZpoOVmQoicTDj+BhUdKpQ
tKUUXdLhMtHR88XlCew0SsjLO3WP1mymW0KO/xkCWRKdX62RXOeq2XapzJbFfdHp
JRd8UG61BF7wT2CmI83gQOenhANxTXFTNI5ftzRLX16RvRB/kdn60tfo21tScp0a
Rh19COFcTqtHm6JIgh580ZUvxCwEudKC/FPo2MRhC5cMoi2KMUE9C96qvuJFoWdN
UAPnPlYpx6OfOFnLATqgTx0bVWfmQ1Q1zzQp9zq3UQTDLvCYKCcT5ufPxNKZYv0h
W+OgIdtVuMh3NKmc3guMvbqToKg7L7ikcZ5TdUbno2pqL5hQnrtgyvc43oShWLfD
qUuVULIu+atkLYlImA6iVzPXoKMtH6U9+pnAy2SHBCKvW18rPE07CqkaGlRdR5xj
6MPmAzdSsOmHOazyYYFdp3/cFNgzeRboUFt/Il0ZY+rV7G4RxuUQQw1Qxd5Gjhu/
VMgEtsZg
=8454
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

--===============5161172246443154305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5161172246443154305==--
