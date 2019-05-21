Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BD7254DF
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 18:07:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3794C7BF8C
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 16:07:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BE7AC7BF8A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 16:07:45 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4LG0xEg006256; Tue, 21 May 2019 18:07:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=wyoDJhWwiWA6o8/+vGaBL1beRxYStu2+JhmJaue/g/0=;
 b=qFVo15c8+DngWvkiO00eu7a7kV8E0DHrLSf1vm663T7C7rQs53X/Y76QR47id0KAjxpp
 JQLu8xrwJnvYbJ4pFbx3vDJznnxhIBZvscZc0yw3mX2JNFnqUd1x2jpI7yNObOqNumVf
 sR5LsyLq1kQOa+jAAX2TS+0rTzwpRr/FkxjgmAyzd0AiRsdMEgqu+Bc+ox7JlgnOJwzL
 NIpXT8t2QhIu3kymqxIhIa+MqgHxeTYg0tU2H84QzqThFre8hFubNa9wrdGplrxIE2uC
 mtKHU0vckgtIaYnaBHd9rJ2zLjHmNafYKXjD+vy7GhGQD5EERVQtIn1Ur0Xtz40mlNyW AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7h0tqv9-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 21 May 2019 18:07:22 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1212531;
 Tue, 21 May 2019 16:07:20 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 807922D6D;
 Tue, 21 May 2019 16:07:20 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 May
 2019 18:07:20 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Tue, 21 May 2019 18:07:20 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH v2 0/8] fdt: Allow indicating a node is for U-Boot proper
 only
Thread-Index: AQHVDwv1UXGLFLlh4kSWD3fXE8isXaZ0A8KAgAG2t9A=
Date: Tue, 21 May 2019 16:07:20 +0000
Message-ID: <f83446fc16414f1fa8d06ca6906dc906@SFHDAG6NODE3.st.com>
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
 <CAPnjgZ12YVhUwTELM6D3R7FkSJAx+1Y5urnzxSsk5vA07dszdA@mail.gmail.com>
In-Reply-To: <CAPnjgZ12YVhUwTELM6D3R7FkSJAx+1Y5urnzxSsk5vA07dszdA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_03:, , signatures=0
Cc: Tien Fong Chee <tien.fong.chee@intel.com>, Bin Meng <bmeng.cn@gmail.com>,
 Stephen Warren <swarren@nvidia.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Igor Opaniuk <igor.opaniuk@linaro.org>,
 Alexander Graf <agraf@suse.de>, Jens Wiklander <jens.wiklander@linaro.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Paul Burton <paul.burton@mips.com>,
 Mario Six <mario.six@gdsys.cc>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Anatolij Gustschin <agust@denx.de>, Chris Packham <judge.packham@gmail.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 0/8] fdt: Allow indicating a node is
 for U-Boot proper only
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Simon,

I will reply for the serie
 
> Hi Patrick,
> 
> On Mon, 20 May 2019 at 07:00, Patrick Delaunay <patrick.delaunay@st.com>
> wrote:
> >
> >
> > Hi,
> >
> > I create this v2 serie with:
> >
> > 1/ documentation update for previous patch
> >    [U-Boot,v2] dm: remove pre reloc properties in SPL and TPL device tree
> >    http://patchwork.ozlabs.org/patch/1081155/
> >
> >    PS: Code is already merged in commit commit c7a88dae997f ("dm: remove
> >        pre reloc properties in SPL and TPL device tree")
> >        but not the documentation.
> >
> > 2/ missing part for (patch 1/2)
> >    http://patchwork.ozlabs.org/project/uboot/list/?series=89846
> >
> > 3/ new tests for pre-reloc propertie in SPL as suggested by Simon
> >    (http://patchwork.ozlabs.org/patch/1081155/#2156621)
> >
> > Tell me if is better to split the serie.
> 
> Somehow this cover letter appears in a patch, hence some of my confusion. I see
> what you are doing and it is a comprehensive approach.
> 
> But please see my comments about comparing the .dtb file instead of making
> sandbox print it out.

I will change the test to only compare the device tree : it is more simple.

=> v3 in few days

My first approach was complicated but it is to allow
- check if sandbox SPL with devicetree and libfdt in working as is already done for platdata
- check if sandbox SPL can start U-Boot in booth case 
  (by executing the simple test_000_version in ./py/tests/test_000_version.py)
- split test and normal device tree (I move the "spl-tests" nodes in test.dts)

But it is too complicated just the purpose of this test.

NB: the executable "u-boot-spl" for sandbox_spl_defconfig already 
       include the devicetree information, with platdata.


> Regards,
> Simon

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
