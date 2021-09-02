Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6343FF5C1
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Sep 2021 23:45:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F49EC57B53;
	Thu,  2 Sep 2021 21:45:14 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B268C0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Sep 2021 21:45:13 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id dm15so5048430edb.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Sep 2021 14:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DX2bR3ruYcTy5kW6ri9c0GRU6F5qCXELAGenkgBecZM=;
 b=AelOX3xki2ts+akxj5pYB5pEbBcQUuN8E4CgLED4MNJMUzrxVEnghQUDhAysy4z1DA
 R8GMLzcTq4Y5FAtu3G1Oc0PSM+JJFLELwlQeguneBXGGAMYtRWz1kJjx054zHiJCHmnj
 X0i9r1vc10expLKKk6jaj+Ahqb4lECl2aW/m0eLM+4cMn5PyPwyJfnDwPEBxlfTXc1br
 PEE7SsP5fQn8exaaKT53K3g+nwjHHDIUDhBTq6ieHi5un9t6Ah6avVvrIyyOzQprCwCI
 btl5kwUblZqqkG8nM0DzL8DdKmH3dSp/AKNUupr06PcWiyz1d3YsdwUM41K0fFCPdUvv
 xRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DX2bR3ruYcTy5kW6ri9c0GRU6F5qCXELAGenkgBecZM=;
 b=uWNxhQHum71312n3PwN7TcaA6uUeClwt7uoakr8W8dis+c8UO6hNWDf2EwHNy5Xn7E
 2VBMikOAQb570k/XTQG3yAKqWnKIJmsZe2/glbep8X2lVo4VvJ5mWPxP3d48Z0TYRyHz
 c1U4MbU4WO59dK3OYN/4l04/jJvxrAidVlEEj4JX7gFDvDu+sT2COsLxMHDM5xdo1c5d
 OD3pDEqGh1AiZQNCd87KxZ6j54Ocf82HnL0bvRGREOm6djty/p/JbLO5iWGHcalVTZ5C
 8GPedfNhVOiwFRRlGXvK6C/b/zV/NE0JgoAbXNlfLioxoQUG8K7vpBbaRC3kYOJ0GCgb
 P/dQ==
X-Gm-Message-State: AOAM530/gQ5k7x2CXrhso2f1sqX3MiNvc+R2cuW9vYpK4m4Jt+0JZ9ei
 tj0S3tPAB3foLwEsX9no4rBQlzKrRRVzlNHd7A16yQ==
X-Google-Smtp-Source: ABdhPJyoPcHbo6yvppkgygPkaYbxR/lXJIEMt9xm6+EuYT338tNzEFp+hyD3X5LsrBJEU08q5wmAfOpzODjBmbW0oAw=
X-Received: by 2002:a50:cc4b:: with SMTP id n11mr450972edi.132.1630619112661; 
 Thu, 02 Sep 2021 14:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210826214209.254461-1-mr.nuke.me@gmail.com>
 <20210826214209.254461-11-mr.nuke.me@gmail.com>
 <1afb6206-e2e9-30e7-33f5-695341e88841@foss.st.com>
 <0d056c73-60ad-2590-a355-1aff7a8af73d@gmail.com>
In-Reply-To: <0d056c73-60ad-2590-a355-1aff7a8af73d@gmail.com>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu, 2 Sep 2021 23:45:01 +0200
Message-ID: <CAN5uoS99crqiF8iOhwJJDR9-L_Xc5bomxPMdyYmg85EQmJMRHA@mail.gmail.com>
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 10/10] stm32mp1: spl: Copy optee nodes to
 target FDT for OP-TEE payloads
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
Content-Type: multipart/mixed; boundary="===============5382844146244018552=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============5382844146244018552==
Content-Type: multipart/alternative; boundary="000000000000f97a1d05cb0a1831"

--000000000000f97a1d05cb0a1831
Content-Type: text/plain; charset="UTF-8"

Hello,

On Wed, 1 Sept 2021 at 17:10, Alex G. <mr.nuke.me@gmail.com> wrote:

> Hi Patrick,
>
> On 8/31/21 12:24 PM, Patrick DELAUNAY wrote:
> > Hi,
> >
> > On 8/26/21 11:42 PM, Alexandru Gagniuc wrote:
> >> OP-TEE does not take a devicetree for its own use. However, it does
> >> pass the devicetree to the normal world OS. In most cases that will
> >> be some other devicetree-bearing platform, such as linux.
> >>
> >> As in other cases where there's an OPTEE payload (e.g. BOOTM_OPTEE),
> >> it is required to copy the optee nodes to he target's FDT. Do this as
> >> part of spl_board_prepare_for_optee().
> >>
> >> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> >> ---
> >>   arch/arm/mach-stm32mp/spl.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
> >> index d9fdc5926c..94fbb45cf9 100644
> >> --- a/arch/arm/mach-stm32mp/spl.c
> >> +++ b/arch/arm/mach-stm32mp/spl.c
> >> @@ -19,6 +19,7 @@
> >>   #include <asm/arch/sys_proto.h>
> >>   #include <mach/tzc.h>
> >>   #include <linux/libfdt.h>
> >> +#include <tee/optee.h>
> >>   u32 spl_boot_device(void)
> >>   {
> >> @@ -182,6 +183,7 @@ void stm32_init_tzc_for_optee(void)
> >>   void spl_board_prepare_for_optee(void *fdt)
> >>   {
> >>       stm32_fdt_setup_mac_addr(fdt);
> >> +    optee_copy_fdt_nodes(fdt);
> >>       stm32_init_tzc_for_optee();
> >>   }
> >
> >
> > NAK the OP-TEE nodes are ADDED by the OP-TEE firmware in the unsecure
> > device tree (when CFG_DT is activated)
> >
> > before to jump to the kernel (that remove the need to have DT
> > allignement with U-Boot SPL device tree)
> >
> > => SPL should not copy the OP-TEE nodes in next stage DT
> >
> > reference in optee_os = core/arch/arm/kernel/boot.c: add_optee_dt_node()
> >
> > add_optee_dt_node() <= update_external_dt() <= paged_init_primary()
> >
> > It is the expected configuration for OP-TEE on STM32MP15 platform.
>
> I agree that if a component modifies the platform, it should be
> responsible for updating the devicetree. Two issues though
>
>
> 1. Consistency
>
> The STM32IMAGE boot path expects u-boot to add the optee nodes, while
> the FIP path expects OP-TEE to add the nodes. Which one do we stick to?
>

U-boot already handles this, no? optee_copy_fdt_nodes() already skips
addition of optee nodes when it's already in.
So if OP-TEE has already filled the DT, u-boot won't add anything, which
looks good (to me).



>
>
> 2. Memory access
>
> I don't understand is how OP-TEE would get past the TZC.
> If we look at optee_os => plat-0stm32mp1/plat_tzc400:
>      "Early boot stage is in charge of configuring memory regions"
> The following memory has been set up by SPL (or TF-A for that matter):
>
>      Nonsec: c0000000->ddffffff
>      Sec:    de000000->dfdfffff
>      SHMEM:  dfe00000->dfffffff
>
> The external DTB will be in the nonsec region, which OP-TEE allegedly
> can't access. So how would this get patched?
>

OP-TEE secure world can access non-secure memory, provided it maps it as
non-secure memory.

regards,
etienne


> Alex
>

--000000000000f97a1d05cb0a1831
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello,</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 1 Sept 2021 at 17:10, Alex =
G. &lt;<a href=3D"mailto:mr.nuke.me@gmail.com">mr.nuke.me@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Patri=
ck,<br>
<br>
On 8/31/21 12:24 PM, Patrick DELAUNAY wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; On 8/26/21 11:42 PM, Alexandru Gagniuc wrote:<br>
&gt;&gt; OP-TEE does not take a devicetree for its own use. However, it doe=
s<br>
&gt;&gt; pass the devicetree to the normal world OS. In most cases that wil=
l<br>
&gt;&gt; be some other devicetree-bearing platform, such as linux.<br>
&gt;&gt;<br>
&gt;&gt; As in other cases where there&#39;s an OPTEE payload (e.g. BOOTM_O=
PTEE),<br>
&gt;&gt; it is required to copy the optee nodes to he target&#39;s FDT. Do =
this as<br>
&gt;&gt; part of spl_board_prepare_for_optee().<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alexandru Gagniuc &lt;<a href=3D"mailto:mr.nuke.me@=
gmail.com" target=3D"_blank">mr.nuke.me@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 arch/arm/mach-stm32mp/spl.c | 2 ++<br>
&gt;&gt; =C2=A0 1 file changed, 2 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/s=
pl.c<br>
&gt;&gt; index d9fdc5926c..94fbb45cf9 100644<br>
&gt;&gt; --- a/arch/arm/mach-stm32mp/spl.c<br>
&gt;&gt; +++ b/arch/arm/mach-stm32mp/spl.c<br>
&gt;&gt; @@ -19,6 +19,7 @@<br>
&gt;&gt; =C2=A0 #include &lt;asm/arch/sys_proto.h&gt;<br>
&gt;&gt; =C2=A0 #include &lt;mach/tzc.h&gt;<br>
&gt;&gt; =C2=A0 #include &lt;linux/libfdt.h&gt;<br>
&gt;&gt; +#include &lt;tee/optee.h&gt;<br>
&gt;&gt; =C2=A0 u32 spl_boot_device(void)<br>
&gt;&gt; =C2=A0 {<br>
&gt;&gt; @@ -182,6 +183,7 @@ void stm32_init_tzc_for_optee(void)<br>
&gt;&gt; =C2=A0 void spl_board_prepare_for_optee(void *fdt)<br>
&gt;&gt; =C2=A0 {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stm32_fdt_setup_mac_addr(fdt);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 optee_copy_fdt_nodes(fdt);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stm32_init_tzc_for_optee();<br>
&gt;&gt; =C2=A0 }<br>
&gt; <br>
&gt; <br>
&gt; NAK the OP-TEE nodes are ADDED by the OP-TEE firmware in the unsecure =
<br>
&gt; device tree (when CFG_DT is activated)<br>
&gt; <br>
&gt; before to jump to the kernel (that remove the need to have DT <br>
&gt; allignement with U-Boot SPL device tree)<br>
&gt; <br>
&gt; =3D&gt; SPL should not copy the OP-TEE nodes in next stage DT<br>
&gt; <br>
&gt; reference in optee_os =3D core/arch/arm/kernel/boot.c: add_optee_dt_no=
de()<br>
&gt; <br>
&gt; add_optee_dt_node() &lt;=3D update_external_dt() &lt;=3D paged_init_pr=
imary()<br>
&gt; <br>
&gt; It is the expected configuration for OP-TEE on STM32MP15 platform.<br>
<br>
I agree that if a component modifies the platform, it should be <br>
responsible for updating the devicetree. Two issues though<br>
<br>
<br>
1. Consistency<br>
<br>
The STM32IMAGE boot path expects u-boot to add the optee nodes, while <br>
the FIP path expects OP-TEE to add the nodes. Which one do we stick to?<br>=
</blockquote><div><br></div><div>U-boot already handles this, no?=C2=A0opte=
e_copy_fdt_nodes() already skips addition of optee nodes when it&#39;s alre=
ady in.</div><div>So if OP-TEE has already filled the DT, u-boot won&#39;t =
add anything, which looks good (to me).</div><div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
2. Memory access<br>
<br>
I don&#39;t understand is how OP-TEE would get past the TZC.<br>
If we look at optee_os =3D&gt; plat-0stm32mp1/plat_tzc400:<br>
=C2=A0 =C2=A0 =C2=A0&quot;Early boot stage is in charge of configuring memo=
ry regions&quot;<br>
The following memory has been set up by SPL (or TF-A for that matter):<br>
<br>
=C2=A0 =C2=A0 =C2=A0Nonsec: c0000000-&gt;ddffffff<br>
=C2=A0 =C2=A0 =C2=A0Sec:=C2=A0 =C2=A0 de000000-&gt;dfdfffff<br>
=C2=A0 =C2=A0 =C2=A0SHMEM:=C2=A0 dfe00000-&gt;dfffffff<br>
<br>
The external DTB will be in the nonsec region, which OP-TEE allegedly <br>
can&#39;t access. So how would this get patched?<br></blockquote><div><br><=
/div><div>OP-TEE secure world can access non-secure memory, provided it map=
s it as non-secure memory.=C2=A0</div><div><br></div><div>regards,</div><di=
v>etienne</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
Alex<br>
</blockquote></div></div>

--000000000000f97a1d05cb0a1831--

--===============5382844146244018552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5382844146244018552==--
