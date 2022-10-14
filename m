Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8925FEE10
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Oct 2022 14:42:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59179C6411E;
	Fri, 14 Oct 2022 12:42:22 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80B0DC640FF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 12:42:20 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id h15so3545517qtu.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=melodyinnovations-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gq7y5RAjpWwl5WeNkgjE6eD+YsH8SP2MshNXv0QPGXM=;
 b=6pCJcqPj90NNcb3EVys74z1k99PHu0EfO2IHkE/QeahSIsK4v3pfC7o/nuBG3+zs6M
 uYRUxBjAaZKkedA1Ulx7D/1Nw4muUyvT74CLFBioef0hJklfuH81vAmO5tg9RBG6wA4Z
 XtUYeInPJ8v84iX7MP7qC7POgbI9WEdP0ZhpvOkCzuCgANV8CNWTryQmAEZC2kZAw0uz
 A6vp416ojek1xkBjvoUNuLTkJ1383be87WI7+/b4cgHWlgLLYoK4db+maAxF4sCeKMB2
 qABXVKX362/pKqNmGd6Bt3NcYDL/EMEcMQC6xReORVo65J4GQXlQpkKPdrLnEibiS30A
 x5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gq7y5RAjpWwl5WeNkgjE6eD+YsH8SP2MshNXv0QPGXM=;
 b=7zMj9ogMjvKHnigPEax0sScHUuLY4KKl61Z+ydUALUar95eHUx868ZRVqscWDN+Jv4
 u0pe/83FJfUWvRwy9/UHofR4iJSX3f2mp4MQCBHHr6nLXbt2yE/ZMwKtQFbs9e2j2/kT
 VwLhz14EyfJXZ04LGsddgjcDR6dXJmGidGY+61IADOkx7qhahRtu6FV8qlPAlK/RzEzf
 hfHa7dYXc0VU2xoHNDBdfrZev0VLz71xW94cLRJBzNC8Za5TttJw7l4TdPnerzsMQLMT
 uX4iiDaLbbUd2CoiSUDfDHUggAhLVWa1BZVhOujMlZ13SSaV0lbi50U9jLOIFhul4U7d
 aoAA==
X-Gm-Message-State: ACrzQf2Ea+wZtV4z96tl/Wf93t0D0caEl+PWznUVhrL6Paq6V2Zjk/Fw
 fik3FSAdFTBsndTQmETqnFh5wPZcT+uZNiBRX29+aB57C9g=
X-Google-Smtp-Source: AMsMyM7cwa6j9h4P4UEKKKqiaYKvbVhaJdn2/tS7caln/u2MyfScvez/AKvwmBQN3T4JliwoMV2800dpmqkyFbT9Vfg=
X-Received: by 2002:ac8:5b87:0:b0:39c:b5a6:193b with SMTP id
 a7-20020ac85b87000000b0039cb5a6193bmr3970147qta.461.1665751339449; Fri, 14
 Oct 2022 05:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <CACBcyETUAQHgXB7XKho4n44enk-uaPBotqfCAyQx8-qcAivOZQ@mail.gmail.com>
 <4fadf61f-7526-e30f-9dfb-723727da2862@foss.st.com>
In-Reply-To: <4fadf61f-7526-e30f-9dfb-723727da2862@foss.st.com>
From: Pralay Panchwate <pralay@melodyinnovations.com>
Date: Fri, 14 Oct 2022 18:12:08 +0530
Message-ID: <CACBcyERwh44TbW-WKFTLfrdvAeUYqYoJo97OyqxgdM3VtSVdow@mail.gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] Issues with Loading Linux OS on our custom made
 STM32 SOM board
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
Content-Type: multipart/mixed; boundary="===============1612264527104336978=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============1612264527104336978==
Content-Type: multipart/alternative; boundary="000000000000df50ba05eafdf40f"

--000000000000df50ba05eafdf40f
Content-Type: text/plain; charset="UTF-8"

Hi Patrice,
I have already submitted this post with the same title on the forum but, No
reply from anyone whatsoever.
Any support form you guys will be highly appreciated.

Regards,
Pralay Panchwate
Embedded Engineer
Melody innovations pvt ltd.
Contact: +91-9850211623

The information transmitted by this email is intended only for the person
or entity to which it is addressed. This email may contain proprietary,
business-confidential, and/or privileged material. If you are not the
intended recipient of this message, be aware that any use, review,
re-transmission, distribution, reproduction or any action taken in reliance
upon this message is strictly prohibited. If you received this in error,
please contact the sender and delete the material from all computers.


On Fri, 14 Oct 2022 at 14:19, Patrice CHOTARD <patrice.chotard@foss.st.com>
wrote:

> Hi Pralay
>
> Submit either your request on online support :
> https://community.st.com/s/onlinesupport
> or
> Post a message on STM32MPUs forum:
> https://community.st.com/s/topic/0TO0X0000003u2AWAQ/stm32-mpus
>
> Thanks
> Patrice
>
> On 10/13/22 11:04, Pralay Panchwate wrote:
> > Hello Everyone,
> > We are in the development phase of our own custom made SOM board using
> > STM32MP157A chip.
> > Can we use STM32MP157A-EV1 image for flashing our custom STM32MP1 based
> > board ?
> >
> > We tried burning our STM32MP1 board with existing "
> > *FlashLayout_emmc_stm32mp157a-ev1-trusted.tsv*" file but it throws
> > following error -
> >
> >  Error: TSV files are only supported for STM32MP
> >
> > We're using an onboard eMMC (From Kioxia) and STM32MP157AAD3 chip from
> ST.
> > I have attached snapshot of log. and I'm extremely in need of support
> > Below is the LOG:
> >
> >
> >    1. user@user:~/STM32MPU-Ecosystem-v4.0.0/Starter-Package/stm32mp1-
> >    openstlinux-5.15-yocto-kirkstone-mp1-v22.06.15/images/stm32mp1$
> >    STM32_Programmer_CLI -c port=usb1 -w
> flashlayout_st-image-weston/trusted/
> >    FlashLayout_emmc_stm32mp157a-ev1-trusted.tsv
> >    2. -------------------------------------------------------------------
> >    3. STM32CubeProgrammer v2.11.0
> >    4. -------------------------------------------------------------------
> >    5.
> >    6.
> >    7.
> >    8. USB speed : High Speed (480MBit/s)
> >    9. Manuf. ID : STMicroelectronics
> >    10. Product ID : DFU in HS Mode @Device ID /0x500, @Revision ID
> /0x0000
> >    11. SN : 0019002C3431511733353431
> >    12. DFU protocol: 1.1
> >    13. Board : --
> >    14. Device ID : 0x0500
> >    15. Device name : STM32MP1
> >    16. Device type : MPU
> >    17. Revision ID : --
> >    18. Device CPU : Cortex-A7
> >    19.
> >    20. Start Embedded Flashing service
> >    21.
> >    22.
> >    23.
> >    24. Memory Programming ...
> >    25. Opening and parsing file: tf-a-stm32mp157a-ev1-usb.stm32
> >    26. File : tf-a-stm32mp157a-ev1-usb.stm32
> >    27. Size : 220.82 KB
> >    28. Partition ID : 0x01
> >    29.
> >    30. Download in Progress:
> >    31. [==================================================] 100%
> >    32.
> >    33. File download complete
> >    34. Time elapsed during download operation: 00:00:01.150
> >    35.
> >    36. RUNNING Program ...
> >    37. PartID: :0x01
> >    38.
> >    39.
> >    40. Error: Start operation failed at partition 0x01
> >    41. Error: TSV flashing service failed
> >    42. user@user:~/STM32MPU-Ecosystem-v4.0.0/Starter-Package/stm32mp1-
> >    openstlinux-5.15-yocto-kirkstone-mp1-v22.06.15/images/stm32mp1$
> >    STM32_Programmer_CLI -c port=usb1 -w
> flashlayout_st-image-weston/trusted/
> >    FlashLayout_emmc_stm32mp157a-ev1-trusted.tsv
> >    43.
> -------------------------------------------------------------------
> >    44. STM32CubeProgrammer v2.11.0
> >    45.
> -------------------------------------------------------------------
> >    46.
> >    47.
> >    48.
> >    49. USB speed : High Speed (480MBit/s)
> >    50. Manuf. ID :
> >    51. Product ID :
> >    52. SN :
> >    53. DFU protocol: 1.1
> >    54. Board : --
> >    55. IAP
> >    56. Error: TSV files are only supported for STM32MP
> >
> >
> > Please help us and revert on this problem ASAP.
> >
> > Regards,
> > Pralay Panchwate
> > Embedded Engineer
> > Melody innovations pvt ltd.
> > Contact: +91-9850211623
> >
> > The information transmitted by this email is intended only for the person
> > or entity to which it is addressed. This email may contain proprietary,
> > business-confidential, and/or privileged material. If you are not the
> > intended recipient of this message, be aware that any use, review,
> > re-transmission, distribution, reproduction or any action taken in
> reliance
> > upon this message is strictly prohibited. If you received this in error,
> > please contact the sender and delete the material from all computers.
> >
> >
> > _______________________________________________
> > Uboot-stm32 mailing list
> > Uboot-stm32@st-md-mailman.stormreply.com
> > https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
>

--000000000000df50ba05eafdf40f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Patrice,<div>I have already submitted this post with th=
e same title on the forum but, No reply from anyone whatsoever.</div><div>A=
ny support form you guys will be highly appreciated.</div><div><br clear=3D=
"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gma=
il_signature"><div dir=3D"ltr"><div>Regards,</div><div>Pralay Panchwate</di=
v>Embedded Engineer<div>Melody innovations pvt ltd.</div><div>Contact: +91-=
9850211623</div><div><img width=3D"200" height=3D"47" src=3D"https://ci3.go=
ogleusercontent.com/mail-sig/AIorK4ytxpV-y9s_755mrUlV8ygQeFKfolkmcd5JgXDpYK=
jrOcZJII0sLqX8JmPDE2IZ2P-zcPyXrLI"><br></div><span style=3D"color:rgb(153,1=
53,153)">The
 information transmitted by this email is intended only for the person=20
or entity to which it is addressed. This email may contain proprietary,=20
business-confidential, and/or privileged material. If you are not the=20
intended recipient of this message, be aware that any use, review,=20
re-transmission, distribution, reproduction or any action taken in=20
reliance upon this message is strictly prohibited. If you received this=20
in error, please contact the sender and delete the material from all=20
computers.</span></div></div></div><br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 14 Oct 2022 at 14:19, =
Patrice CHOTARD &lt;<a href=3D"mailto:patrice.chotard@foss.st.com">patrice.=
chotard@foss.st.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi Pralay<br>
<br>
Submit either your request on online support : <a href=3D"https://community=
.st.com/s/onlinesupport" rel=3D"noreferrer" target=3D"_blank">https://commu=
nity.st.com/s/onlinesupport</a><br>
or <br>
Post a message on STM32MPUs forum: <a href=3D"https://community.st.com/s/to=
pic/0TO0X0000003u2AWAQ/stm32-mpus" rel=3D"noreferrer" target=3D"_blank">htt=
ps://community.st.com/s/topic/0TO0X0000003u2AWAQ/stm32-mpus</a><br>
<br>
Thanks<br>
Patrice<br>
<br>
On 10/13/22 11:04, Pralay Panchwate wrote:<br>
&gt; Hello Everyone,<br>
&gt; We are in the development phase of our own custom made SOM board using=
<br>
&gt; STM32MP157A chip.<br>
&gt; Can we use STM32MP157A-EV1 image for flashing our custom STM32MP1 base=
d<br>
&gt; board ?<br>
&gt; <br>
&gt; We tried burning our STM32MP1 board with existing &quot;<br>
&gt; *FlashLayout_emmc_stm32mp157a-ev1-trusted.tsv*&quot; file but it throw=
s<br>
&gt; following error -<br>
&gt; <br>
&gt;=C2=A0 Error: TSV files are only supported for STM32MP<br>
&gt; <br>
&gt; We&#39;re using an onboard eMMC (From Kioxia) and STM32MP157AAD3 chip =
from ST.<br>
&gt; I have attached snapshot of log. and I&#39;m extremely in need of supp=
ort<br>
&gt; Below is the LOG:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 1. user@user:~/STM32MPU-Ecosystem-v4.0.0/Starter-Package/=
stm32mp1-<br>
&gt;=C2=A0 =C2=A0 openstlinux-5.15-yocto-kirkstone-mp1-v22.06.15/images/stm=
32mp1$<br>
&gt;=C2=A0 =C2=A0 STM32_Programmer_CLI -c port=3Dusb1 -w flashlayout_st-ima=
ge-weston/trusted/<br>
&gt;=C2=A0 =C2=A0 FlashLayout_emmc_stm32mp157a-ev1-trusted.tsv<br>
&gt;=C2=A0 =C2=A0 2. ------------------------------------------------------=
-------------<br>
&gt;=C2=A0 =C2=A0 3. STM32CubeProgrammer v2.11.0<br>
&gt;=C2=A0 =C2=A0 4. ------------------------------------------------------=
-------------<br>
&gt;=C2=A0 =C2=A0 5.<br>
&gt;=C2=A0 =C2=A0 6.<br>
&gt;=C2=A0 =C2=A0 7.<br>
&gt;=C2=A0 =C2=A0 8. USB speed : High Speed (480MBit/s)<br>
&gt;=C2=A0 =C2=A0 9. Manuf. ID : STMicroelectronics<br>
&gt;=C2=A0 =C2=A0 10. Product ID : DFU in HS Mode @Device ID /0x500, @Revis=
ion ID /0x0000<br>
&gt;=C2=A0 =C2=A0 11. SN : 0019002C3431511733353431<br>
&gt;=C2=A0 =C2=A0 12. DFU protocol: 1.1<br>
&gt;=C2=A0 =C2=A0 13. Board : --<br>
&gt;=C2=A0 =C2=A0 14. Device ID : 0x0500<br>
&gt;=C2=A0 =C2=A0 15. Device name : STM32MP1<br>
&gt;=C2=A0 =C2=A0 16. Device type : MPU<br>
&gt;=C2=A0 =C2=A0 17. Revision ID : --<br>
&gt;=C2=A0 =C2=A0 18. Device CPU : Cortex-A7<br>
&gt;=C2=A0 =C2=A0 19.<br>
&gt;=C2=A0 =C2=A0 20. Start Embedded Flashing service<br>
&gt;=C2=A0 =C2=A0 21.<br>
&gt;=C2=A0 =C2=A0 22.<br>
&gt;=C2=A0 =C2=A0 23.<br>
&gt;=C2=A0 =C2=A0 24. Memory Programming ...<br>
&gt;=C2=A0 =C2=A0 25. Opening and parsing file: tf-a-stm32mp157a-ev1-usb.st=
m32<br>
&gt;=C2=A0 =C2=A0 26. File : tf-a-stm32mp157a-ev1-usb.stm32<br>
&gt;=C2=A0 =C2=A0 27. Size : 220.82 KB<br>
&gt;=C2=A0 =C2=A0 28. Partition ID : 0x01<br>
&gt;=C2=A0 =C2=A0 29.<br>
&gt;=C2=A0 =C2=A0 30. Download in Progress:<br>
&gt;=C2=A0 =C2=A0 31. [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D] 100%<br>
&gt;=C2=A0 =C2=A0 32.<br>
&gt;=C2=A0 =C2=A0 33. File download complete<br>
&gt;=C2=A0 =C2=A0 34. Time elapsed during download operation: 00:00:01.150<=
br>
&gt;=C2=A0 =C2=A0 35.<br>
&gt;=C2=A0 =C2=A0 36. RUNNING Program ...<br>
&gt;=C2=A0 =C2=A0 37. PartID: :0x01<br>
&gt;=C2=A0 =C2=A0 38.<br>
&gt;=C2=A0 =C2=A0 39.<br>
&gt;=C2=A0 =C2=A0 40. Error: Start operation failed at partition 0x01<br>
&gt;=C2=A0 =C2=A0 41. Error: TSV flashing service failed<br>
&gt;=C2=A0 =C2=A0 42. user@user:~/STM32MPU-Ecosystem-v4.0.0/Starter-Package=
/stm32mp1-<br>
&gt;=C2=A0 =C2=A0 openstlinux-5.15-yocto-kirkstone-mp1-v22.06.15/images/stm=
32mp1$<br>
&gt;=C2=A0 =C2=A0 STM32_Programmer_CLI -c port=3Dusb1 -w flashlayout_st-ima=
ge-weston/trusted/<br>
&gt;=C2=A0 =C2=A0 FlashLayout_emmc_stm32mp157a-ev1-trusted.tsv<br>
&gt;=C2=A0 =C2=A0 43. -----------------------------------------------------=
--------------<br>
&gt;=C2=A0 =C2=A0 44. STM32CubeProgrammer v2.11.0<br>
&gt;=C2=A0 =C2=A0 45. -----------------------------------------------------=
--------------<br>
&gt;=C2=A0 =C2=A0 46.<br>
&gt;=C2=A0 =C2=A0 47.<br>
&gt;=C2=A0 =C2=A0 48.<br>
&gt;=C2=A0 =C2=A0 49. USB speed : High Speed (480MBit/s)<br>
&gt;=C2=A0 =C2=A0 50. Manuf. ID :<br>
&gt;=C2=A0 =C2=A0 51. Product ID :<br>
&gt;=C2=A0 =C2=A0 52. SN :<br>
&gt;=C2=A0 =C2=A0 53. DFU protocol: 1.1<br>
&gt;=C2=A0 =C2=A0 54. Board : --<br>
&gt;=C2=A0 =C2=A0 55. IAP<br>
&gt;=C2=A0 =C2=A0 56. Error: TSV files are only supported for STM32MP<br>
&gt; <br>
&gt; <br>
&gt; Please help us and revert on this problem ASAP.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Pralay Panchwate<br>
&gt; Embedded Engineer<br>
&gt; Melody innovations pvt ltd.<br>
&gt; Contact: +91-9850211623<br>
&gt; <br>
&gt; The information transmitted by this email is intended only for the per=
son<br>
&gt; or entity to which it is addressed. This email may contain proprietary=
,<br>
&gt; business-confidential, and/or privileged material. If you are not the<=
br>
&gt; intended recipient of this message, be aware that any use, review,<br>
&gt; re-transmission, distribution, reproduction or any action taken in rel=
iance<br>
&gt; upon this message is strictly prohibited. If you received this in erro=
r,<br>
&gt; please contact the sender and delete the material from all computers.<=
br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; Uboot-stm32 mailing list<br>
&gt; <a href=3D"mailto:Uboot-stm32@st-md-mailman.stormreply.com" target=3D"=
_blank">Uboot-stm32@st-md-mailman.stormreply.com</a><br>
&gt; <a href=3D"https://st-md-mailman.stormreply.com/mailman/listinfo/uboot=
-stm32" rel=3D"noreferrer" target=3D"_blank">https://st-md-mailman.stormrep=
ly.com/mailman/listinfo/uboot-stm32</a><br>
_______________________________________________<br>
Uboot-stm32 mailing list<br>
<a href=3D"mailto:Uboot-stm32@st-md-mailman.stormreply.com" target=3D"_blan=
k">Uboot-stm32@st-md-mailman.stormreply.com</a><br>
<a href=3D"https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm3=
2" rel=3D"noreferrer" target=3D"_blank">https://st-md-mailman.stormreply.co=
m/mailman/listinfo/uboot-stm32</a><br>
</blockquote></div>

--000000000000df50ba05eafdf40f--

--===============1612264527104336978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1612264527104336978==--
