Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FB9190815
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 09:50:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53B05C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 08:50:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBE97C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 08:50:26 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O8ldAB004097; Tue, 24 Mar 2020 09:50:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=bv2sH6cEeI7xJAXX1QFzLInzlJk8e2Pra2veIDiIRNc=;
 b=nzv5Fw2DL/S2/U8+CWqz2BzdNf3/6PHpkW5O4bgMfXYf7/IVx5h0XxZxSKNor3w8r0pe
 Jyd3N2cduC4demoZYRnYnmUfAyLTaDwp/CsdkqVCsKlkF2m8TVxXrcmKTfIBL+A0lhbW
 gEIDK8Qn4Jkn6HqFMgKuKmBzt0hoQmeShQYYLazabjGxObRGBoKwR0UNJSz9729s70ww
 DGQY8E3yxhx9RlPhj1O7OyfbK+1HzQ8oAVfUQWv8p+fGrEbLwETlkrCCFZ5YxO49nMva
 4rFHDolxphUbhiidymRMTEPDDR+3gN4lmYr9feZeVeQ2P9P+lC1t71ROYxRZrdFWseEP xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw995eetp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 09:50:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A7A89100039;
 Tue, 24 Mar 2020 09:50:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A00B221FE90;
 Tue, 24 Mar 2020 09:50:25 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 09:50:25 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 09:50:25 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 5/9] ram: stm32mp1: tuning: deactivate derating during
 BIST test
Thread-Index: AQHV86AISLAgNkanvUG28ZbRvgmd2ahXiyVQ
Date: Tue, 24 Mar 2020 08:50:25 +0000
Message-ID: <b8cab3bb61d04e9f9f5f3c2b0b10fe8e@SFHDAG6NODE3.st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
 <20200306111355.5.I2f3d97c071fc1de6dae7e15ee0bbc1df0f16fd9a@changeid>
In-Reply-To: <20200306111355.5.I2f3d97c071fc1de6dae7e15ee0bbc1df0f16fd9a@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_02:2020-03-23,
 2020-03-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 5/9] ram: stm32mp1: tuning: deactivate
 derating during BIST test
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

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: vendredi 6 mars 2020 11:14
> 
> The derating (timing parameter derating using MR4 read value) can't be activated
> during BIST test, as the MR4 read answer will be not understood by BIST
> (BISTGSR.BDONE bit stay at 0, BISTWCSR.DXWCNT = 0x206 instead of
> BISTWCR.BWCNT = 0x200).
> 
> This patch only impacts the tuning on LPDDR2/LPDDR3, if
> derateen.derate_enable = 1.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm/next, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
