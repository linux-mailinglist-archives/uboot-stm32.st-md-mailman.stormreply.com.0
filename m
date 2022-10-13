Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC465FEA05
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Oct 2022 10:03:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C633C6411E;
	Fri, 14 Oct 2022 08:03:33 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B38A0C0D2BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 09:04:18 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id c23so602933qtw.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 02:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=melodyinnovations-com.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NrY5WvAshTfQnUI8QhicsKfDmcvX7JrmGsWaCyJflJM=;
 b=Ecfu/XW3Rq8jeu71yyXOcUV26+DvwS8SoJCu7azpgMUKd9FoVheCz4hLhvwxHGdUY0
 Rr9+4yWLw34+uqUqwUB6XYyQy8hrmHTRNUy2VC2mNYY9i3dI1KnRjLLt3+Ox/qBmqZ3d
 dy1iDBMoMRVR3CA9mRGTOmwLDHaMBuxqwlGdYNHQ4+6tQWXaXKlCdQ+SFQDyg6sX+vef
 Lw5p2Rp8Tx3ojK+jrOCO1SJJP6a7uRQz/3vw5Xk1Xz401QXvGBuY7AEbQzPmxhHtrQF0
 Utt2uSrjc6+mAdVbm/DOTOzhoeunLWQAeA3PccDtv5uMNqAmm0+0IgeEVUTat918HTUV
 WGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NrY5WvAshTfQnUI8QhicsKfDmcvX7JrmGsWaCyJflJM=;
 b=LEHZZ7kHaFIwkHSwyrtlYd8PosccnQaVbG/3DG6gP5uoQOOOq8CqOYXBRe3cZlVQjj
 gotKxBtSXQdvS0OlvcBmshI+n0LCPBl/zUX+UdJQZQFTa6jXld1YTNzHT0DDoVX/ZwWu
 une7EssgkzEgCqcvCNLXKhugqZak9odOlxNKCNMqkUcbeVQ0AL2BOvfcMroA2oDKJbHm
 M+yyw9CyBY8/WkNQqV6ztX3mB16gZddq99rstg0YpoW07Du24JfSvW431PdeaewEHSbz
 hQ/O5JkpckHl/NqzKbIR+zFRbaJGM/0wmJbyZoodr0GL3EyjRHvDub8m6bw56UHkOKzR
 oqOg==
X-Gm-Message-State: ACrzQf0FTJZwrxgOPp0hCHXjzfgpWZUUQnl+xUGa9eBuPMI9FlGiDr/2
 DO6H9Efk3PVSqSuAUUB0gQ8r9rSgI0H7LaSu+2ttBHRxecWwXQ==
X-Google-Smtp-Source: AMsMyM6T4QM51rc4+e+S2XfLMOTr+21pTA8hFPG+sVV2IMkWPL/MNbYETKWuJ9dW5dmupaEXJy/KywGNSSlyADdBsZ8=
X-Received: by 2002:ac8:5b87:0:b0:39c:b5a6:193b with SMTP id
 a7-20020ac85b87000000b0039cb5a6193bmr9424229qta.461.1665651857488; Thu, 13
 Oct 2022 02:04:17 -0700 (PDT)
MIME-Version: 1.0
From: Pralay Panchwate <pralay@melodyinnovations.com>
Date: Thu, 13 Oct 2022 14:34:06 +0530
Message-ID: <CACBcyETUAQHgXB7XKho4n44enk-uaPBotqfCAyQx8-qcAivOZQ@mail.gmail.com>
To: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Fri, 14 Oct 2022 08:03:30 +0000
Subject: [Uboot-stm32] Issues with Loading Linux OS on our custom made STM32
	SOM board
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
Content-Type: multipart/mixed; boundary="===============2759948186609818818=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============2759948186609818818==
Content-Type: multipart/alternative; boundary="000000000000490af705eae6cb05"

--000000000000490af705eae6cb05
Content-Type: text/plain; charset="UTF-8"

Hello Everyone,
We are in the development phase of our own custom made SOM board using
STM32MP157A chip.
Can we use STM32MP157A-EV1 image for flashing our custom STM32MP1 based
board ?

We tried burning our STM32MP1 board with existing "
*FlashLayout_emmc_stm32mp157a-ev1-trusted.tsv*" file but it throws
following error -

 Error: TSV files are only supported for STM32MP

We're using an onboard eMMC (From Kioxia) and STM32MP157AAD3 chip from ST.
I have attached snapshot of log. and I'm extremely in need of support
Below is the LOG:


   1. user@user:~/STM32MPU-Ecosystem-v4.0.0/Starter-Package/stm32mp1-
   openstlinux-5.15-yocto-kirkstone-mp1-v22.06.15/images/stm32mp1$
   STM32_Programmer_CLI -c port=usb1 -w flashlayout_st-image-weston/trusted/
   FlashLayout_emmc_stm32mp157a-ev1-trusted.tsv
   2. -------------------------------------------------------------------
   3. STM32CubeProgrammer v2.11.0
   4. -------------------------------------------------------------------
   5.
   6.
   7.
   8. USB speed : High Speed (480MBit/s)
   9. Manuf. ID : STMicroelectronics
   10. Product ID : DFU in HS Mode @Device ID /0x500, @Revision ID /0x0000
   11. SN : 0019002C3431511733353431
   12. DFU protocol: 1.1
   13. Board : --
   14. Device ID : 0x0500
   15. Device name : STM32MP1
   16. Device type : MPU
   17. Revision ID : --
   18. Device CPU : Cortex-A7
   19.
   20. Start Embedded Flashing service
   21.
   22.
   23.
   24. Memory Programming ...
   25. Opening and parsing file: tf-a-stm32mp157a-ev1-usb.stm32
   26. File : tf-a-stm32mp157a-ev1-usb.stm32
   27. Size : 220.82 KB
   28. Partition ID : 0x01
   29.
   30. Download in Progress:
   31. [==================================================] 100%
   32.
   33. File download complete
   34. Time elapsed during download operation: 00:00:01.150
   35.
   36. RUNNING Program ...
   37. PartID: :0x01
   38.
   39.
   40. Error: Start operation failed at partition 0x01
   41. Error: TSV flashing service failed
   42. user@user:~/STM32MPU-Ecosystem-v4.0.0/Starter-Package/stm32mp1-
   openstlinux-5.15-yocto-kirkstone-mp1-v22.06.15/images/stm32mp1$
   STM32_Programmer_CLI -c port=usb1 -w flashlayout_st-image-weston/trusted/
   FlashLayout_emmc_stm32mp157a-ev1-trusted.tsv
   43. -------------------------------------------------------------------
   44. STM32CubeProgrammer v2.11.0
   45. -------------------------------------------------------------------
   46.
   47.
   48.
   49. USB speed : High Speed (480MBit/s)
   50. Manuf. ID :
   51. Product ID :
   52. SN :
   53. DFU protocol: 1.1
   54. Board : --
   55. IAP
   56. Error: TSV files are only supported for STM32MP


Please help us and revert on this problem ASAP.

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

--000000000000490af705eae6cb05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font size=3D"4">Hello Everyone,</font></div><div><fo=
nt size=3D"4">We are in the development phase of our own custom made SOM bo=
ard using STM32MP157A chip.</font></div><div><font size=3D"4"><span>Can we =
use STM32MP157A-EV1 image for flashing our custom STM32MP1 based board ?</s=
pan></font></div><div><p><font size=3D"4"><span dir=3D"ltr"> We tried burni=
ng our STM32MP1 board with existing &quot;</span><b><span dir=3D"ltr">Flash=
Layout_emmc_stm32mp157a-ev1-trusted.tsv</span></b><span dir=3D"ltr">&quot; =
file but it throws following error - </span></font></p><p><font size=3D"4">=
<span dir=3D"ltr">=C2=A0Error: TSV files are only supported for STM32MP</sp=
an></font></p><p><font size=3D"4"><span dir=3D"ltr">We&#39;re using an onbo=
ard eMMC (From Kioxia) and STM32MP157AAD3 chip from ST. I=20
have attached snapshot of log. and I&#39;m extremely in need of support</sp=
an></font></p></div><div><font size=3D"4"><span style=3D"font-family:arial,=
sans-serif">Below is the LOG:</span></font></div><div><br></div><div><code>=
<ol><li><span>user@user</span><span>:~</span><span>/STM32MPU-Ecosystem-v4.0=
.0/</span><span>Starter</span><span>-</span><span>Package</span><span>/</sp=
an><span>stm32mp1</span><span>-</span><span>openstlinux</span><span>-</span=
><span>5.15</span><span>-</span><span>yocto</span><span>-</span><span>kirks=
tone</span><span>-</span><span>mp1</span><span>-</span><span>v22</span><spa=
n>.</span><span>06.15</span><span>/</span><span>images</span><span>/</span>=
<span>stm32mp1$ STM32_Programmer_CLI </span><span>-</span><span>c port</spa=
n><span>=3D</span><span>usb1 </span><span>-</span><span>w flashlayout_st</s=
pan><span>-</span><span>image</span><span>-</span><span>weston</span><span>=
/</span><span>trusted</span><span>/</span><span>FlashLayout_emmc_stm32mp157=
a</span><span>-</span><span>ev1</span><span>-</span><span>trusted</span><sp=
an>.</span><span>tsv </span></li><li><span>      </span><span>-------------=
------------------------------------------------------</span></li><li><span=
>                        STM32CubeProgrammer v2</span><span>.</span><span>1=
1.0</span><span>                  </span></li><li><span>      </span><span>=
-------------------------------------------------------------------</span><=
/li><li><span>=C2=A0</span></li><li><span>=C2=A0</span></li><li><span>=C2=
=A0</span></li><li><span>USB speed   </span><span>:</span><span> </span><sp=
an>High</span><span> </span><span>Speed</span><span> </span><span>(</span><=
span>480MBit</span><span>/</span><span>s</span><span>)</span></li><li><span=
>Manuf</span><span>.</span><span> ID   </span><span>:</span><span> </span><=
span>STMicroelectronics</span></li><li><span>Product</span><span> ID  </spa=
n><span>:</span><span> DFU </span><span>in</span><span> HS </span><span>Mod=
e</span><span> </span><span>@Device</span><span> ID </span><span>/</span><s=
pan>0x500</span><span>,</span><span> </span><span>@Revision</span><span> ID=
 </span><span>/</span><span>0x0000</span></li><li><span>SN          </span>=
<span>:</span><span> </span><span>0019002C3431511733353431</span></li><li><=
span>DFU protocol</span><span>:</span><span> </span><span>1.1</span></li><l=
i><span>Board</span><span>       </span><span>:</span><span> </span><span>-=
-</span></li><li><span>Device</span><span> ID   </span><span>:</span><span>=
 </span><span>0x0500</span></li><li><span>Device</span><span> name </span><=
span>:</span><span> STM32MP1</span></li><li><span>Device</span><span> type =
</span><span>:</span><span> MPU</span></li><li><span>Revision</span><span> =
ID </span><span>:</span><span> </span><span>--</span><span>  </span></li><l=
i><span>Device</span><span> CPU  </span><span>:</span><span> </span><span>C=
ortex</span><span>-</span><span>A7</span></li><li><span>=C2=A0</span></li><=
li><span>Start</span><span> </span><span>Embedded</span><span> </span><span=
>Flashing</span><span> service</span></li><li><span>=C2=A0</span></li><li><=
span>=C2=A0</span></li><li><span>=C2=A0</span></li><li><span>Memory</span><=
span> </span><span>Programming</span><span> </span><span>...</span></li><li=
><span>Opening</span><span> </span><span>and</span><span> parsing file</spa=
n><span>:</span><span> tf</span><span>-</span><span>a</span><span>-</span><=
span>stm32mp157a</span><span>-</span><span>ev1</span><span>-</span><span>us=
b</span><span>.</span><span>stm32</span></li><li><span>  </span><span>File<=
/span><span>          </span><span>:</span><span> tf</span><span>-</span><s=
pan>a</span><span>-</span><span>stm32mp157a</span><span>-</span><span>ev1</=
span><span>-</span><span>usb</span><span>.</span><span>stm32</span></li><li=
><span>  </span><span>Size</span><span>          </span><span>:</span><span=
> </span><span>220.82</span><span> KB </span></li><li><span>  </span><span>=
Partition</span><span> ID  </span><span>:</span><span> </span><span>0x01</s=
pan><span> </span></li><li><span>=C2=A0</span></li><li><span>Download</span=
><span> </span><span>in</span><span> </span><span>Progress</span><span>:</s=
pan></li><li><span>[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D]</span><span> </span><span>100</span><span>%</span><s=
pan> </span></li><li><span>=C2=A0</span></li><li><span>File</span><span> do=
wnload complete</span></li><li><span>Time</span><span> elapsed during downl=
oad operation</span><span>:</span><span> </span><span>00</span><span>:</spa=
n><span>00</span><span>:</span><span>01.150</span></li><li><span>=C2=A0</sp=
an></li><li><span>RUNNING </span><span>Program</span><span> </span><span>..=
.</span><span> </span></li><li><span>  </span><span>PartID</span><span>:</s=
pan><span>      </span><span>:</span><span>0x01</span><span> </span></li><l=
i><span>=C2=A0</span></li><li><span>=C2=A0</span></li><li><span>Error</span=
><span>:</span><span> </span><span>Start</span><span> operation failed at p=
artition </span><span>0x01</span></li><li><span>Error</span><span>:</span><=
span> TSV flashing service failed</span></li><li><span>user@user</span><spa=
n>:~</span><span>/STM32MPU-Ecosystem-v4.0.0/</span><span>Starter</span><spa=
n>-</span><span>Package</span><span>/</span><span>stm32mp1</span><span>-</s=
pan><span>openstlinux</span><span>-</span><span>5.15</span><span>-</span><s=
pan>yocto</span><span>-</span><span>kirkstone</span><span>-</span><span>mp1=
</span><span>-</span><span>v22</span><span>.</span><span>06.15</span><span>=
/</span><span>images</span><span>/</span><span>stm32mp1$ STM32_Programmer_C=
LI </span><span>-</span><span>c port</span><span>=3D</span><span>usb1 </spa=
n><span>-</span><span>w flashlayout_st</span><span>-</span><span>image</spa=
n><span>-</span><span>weston</span><span>/</span><span>trusted</span><span>=
/</span><span>FlashLayout_emmc_stm32mp157a</span><span>-</span><span>ev1</s=
pan><span>-</span><span>trusted</span><span>.</span><span>tsv </span></li><=
li><span>      </span><span>-----------------------------------------------=
--------------------</span></li><li><span>                        STM32Cube=
Programmer v2</span><span>.</span><span>11.0</span><span>                  =
</span></li><li><span>      </span><span>----------------------------------=
---------------------------------</span></li><li><span>=C2=A0</span></li><l=
i><span>=C2=A0</span></li><li><span>=C2=A0</span></li><li><span>USB speed  =
 </span><span>:</span><span> </span><span>High</span><span> </span><span>Sp=
eed</span><span> </span><span>(</span><span>480MBit</span><span>/</span><sp=
an>s</span><span>)</span></li><li><span>Manuf</span><span>.</span><span> ID=
   </span><span>:</span><span> </span></li><li><span>Product</span><span> I=
D  </span><span>:</span><span> </span></li><li><span>SN          </span><sp=
an>:</span><span> </span></li><li><span>DFU protocol</span><span>:</span><s=
pan> </span><span>1.1</span></li><li><span>Board</span><span>       </span>=
<span>:</span><span> </span><span>--</span></li><li><span>IAP</span></li><l=
i><span>Error</span><span>:</span><span> TSV files are only supported </spa=
n><span>for</span><span> STM32MP</span></li></ol><div><br></div><div><font =
size=3D"4"><span style=3D"font-family:arial,sans-serif">Please help us and =
revert on this problem ASAP.</span></font></div><div><font size=3D"4"><span=
 style=3D"font-family:arial,sans-serif"><br></span></font></div></code></di=
v><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Regards,</div><div>Pralay Panchwate</div>Em=
bedded Engineer<div>Melody innovations pvt ltd.</div><div>Contact: +91-9850=
211623</div><div><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIo=
rK4ytxpV-y9s_755mrUlV8ygQeFKfolkmcd5JgXDpYKjrOcZJII0sLqX8JmPDE2IZ2P-zcPyXrL=
I" width=3D"200" height=3D"47"><br></div><span style=3D"color:rgb(153,153,1=
53)">The
 information transmitted by this email is intended only for the person=20
or entity to which it is addressed. This email may contain proprietary,=20
business-confidential, and/or privileged material. If you are not the=20
intended recipient of this message, be aware that any use, review,=20
re-transmission, distribution, reproduction or any action taken in=20
reliance upon this message is strictly prohibited. If you received this=20
in error, please contact the sender and delete the material from all=20
computers.</span></div></div></div></div>

--000000000000490af705eae6cb05--

--===============2759948186609818818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2759948186609818818==--
