Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C947E43947
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Jun 2019 17:12:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 765E3CB5209
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Jun 2019 15:12:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76C64CB5205
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2019 15:12:55 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5DF47KX018215; Thu, 13 Jun 2019 17:12:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=dlhjPccE0ZgPjy01Om5BOVSvh7eL4ucpb7cC/4r4kY0=;
 b=wANlilp/eseoO6RmSt6iIsPrTttPwbmYfGqmgkh27OY9OdiwHSwG0npBhFE3swyLO5KQ
 JbF8RA61BJxDr7+7WT9ZaL6RSvBcbeO81ih0nN24bukjkAvYP9aFvglMDyYqTRi6JYt1
 pGe1TqZLLhevSuIiJpprQ5QnODHlFeCUryMiIY9SHSabcL74FpRbDPnrDoes8szm4Fw1
 4U16IZ5VvOTIARF+v3nH/BpX6IwbGKYHnmuIBBosSDwqwcE5ynGOAA3Akaj8s1EoympF
 /SrhLoUMh/eH2KAFT02Q7U1A0Fdh2orjsgtIcBsNrqX9bvtZeh81S3SxmcC+GM9S3ZDz JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t2f8c4p5t-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 13 Jun 2019 17:12:42 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A83A34;
 Thu, 13 Jun 2019 15:12:39 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B7EB4B26;
 Thu, 13 Jun 2019 15:12:39 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Jun
 2019 17:12:39 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Jun 2019 17:12:39 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v3 0/3] fdt: Allow indicating a node is for U-Boot proper
 only
Thread-Index: AQHVD/lYx3gnq8Eg2EiOIGK8Aeoo/6aZzRCQ
Date: Thu, 13 Jun 2019 15:12:39 +0000
Message-ID: <228acf4bb47c4124bf07e6e032647e04@SFHDAG6NODE3.st.com>
References: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-13_10:, , signatures=0
Cc: Tien Fong Chee <tien.fong.chee@intel.com>,
 Anatolij Gustschin <agust@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Simon
 Goldschmidt <simon.k.r.goldschmidt@gmail.com>, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Eugen
 Hristev <eugen.hristev@microchip.com>, Bin Meng <bmeng.cn@gmail.com>,
 Chris Packham <judge.packham@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 0/3] fdt: Allow indicating a node is
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

> 
> Hi,
> 
> I create this serie with:
> 
> 1/ documentation update for previous patch
>    [U-Boot,v2] dm: remove pre reloc properties in SPL and TPL device tree
>    http://patchwork.ozlabs.org/patch/1081155/
> 
>    PS: Code is already merged in commit commit c7a88dae997f ("dm: remove
>        pre reloc properties in SPL and TPL device tree")
>        but not the documentation.
> 
> 2/ missing part for v1 serie (patch 1/2)
>    http://patchwork.ozlabs.org/project/uboot/list/?series=89846
>    => http://patchwork.ozlabs.org/patch/1035797
> 
> 3/ new tests for pre-reloc propertie in SPL as suggested by Simon
>    (http://patchwork.ozlabs.org/patch/1081155/#2156621)
> 
> Regards
> Patrick
> 
> 
> Changes in v3:
> - simplify test after Simon remarks by using fdtgrep on spl dtb
> - rebase on u-boot-dm/sandbox-working
> 
> Changes in v2:
> - rebase on master
> 
> Patrick Delaunay (3):
>   test: check u-boot properties in SPL device tree
>   fdt: Allow indicating a node is for U-Boot proper only
>   dm: doc: add documentation for pre-reloc properties in SPL and TPL
> 
>  arch/sandbox/dts/sandbox.dtsi    | 18 ++++++++++++++++++
>  doc/README.SPL                   | 16 ++++++++++++++++
>  doc/README.TPL                   |  4 ++++
>  doc/driver-model/README.txt      |  4 ++++
>  drivers/core/util.c              |  2 ++
>  drivers/video/video-uclass.c     |  4 +++-
>  include/dm/ofnode.h              |  6 ++++--
>  include/dm/util.h                |  6 ++++--
>  test/py/tests/test_ofplatdata.py | 28 ++++++++++++++++++++++++++++
>  9 files changed, 83 insertions(+), 5 deletions(-)
> 
> --
> 2.7.4

Gentle reminder

targeted for v2019.07 or for next release v2019.10 ?

Not blocking for my board (as display is not yet supported).

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
