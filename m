Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E014A243
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jan 2020 11:49:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD365C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jan 2020 10:49:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A60B0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 10:49:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00RAhwkT011041; Mon, 27 Jan 2020 11:49:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=DSEw+YMJujJ2GsCfesOYaLX54nShm9Un/r+62Bl4H+g=;
 b=nTYU++VcVXinEO2FZRzgL8oB/dDf/q5o7VI2h7lR/07oppldiY2ORFKAON0qlWaZKWd9
 wSujAmoo51P0H6jzZtLUnEJZxjwoChRIEYS58sdexQ3+NqooWcq5lidtbq37eeQ3vMyb
 H19NJAWrnIbrCbwKLxc47s0JccIw/Icsj+0Wjqh7HszEK9p/ICXjgw+Z/ZCLVtBZD/7c
 +egCne05xrVouW993so1w7m+KSqdUkyRdgQReWnpOroKtBSSBUXbGE+QzJgR3uXHTT4s
 EzVwd+kCfJtI3rz8djGeA2oCcSX5RbXi4Dvt3KJZqqQjGuM+YRB2qXeo7qD+6iqenuCG Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrc130gb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2020 11:49:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D890100039;
 Mon, 27 Jan 2020 11:49:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28FEB2A4D97;
 Mon, 27 Jan 2020 11:49:36 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jan
 2020 11:49:35 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 27 Jan 2020 11:49:35 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>
Thread-Topic: [PATCH] env: add prototypes for weak function
Thread-Index: AQHV0rOiLoHY7TzjIE6p3to53pTuj6f5u64AgASU3AA=
Date: Mon, 27 Jan 2020 10:49:35 +0000
Message-ID: <9231afe22ebe437492079368dbe9afc2@SFHDAG6NODE3.st.com>
References: <20200124124142.392-1-patrick.delaunay@st.com>
 <20200124131936.48EEC24065B@gemini.denx.de>
In-Reply-To: <20200124131936.48EEC24065B@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_02:2020-01-24,
 2020-01-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] env: add prototypes for weak function
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

> From: Wolfgang Denk <wd@denx.de>
> Sent: vendredi 24 janvier 2020 14:20
> 
> Dear Patrick,
> 
> In message <20200124124142.392-1-patrick.delaunay@st.com> you wrote:
> >
> > +/* allows to set ext4 interface */
> > +const char *env_ext4_get_intf(void);
> 
> Are you sure these comments are correct?
> 
> A "get interface" function is not supposed to set anything?
> 
> > +/* allows to set ext4 device and partition */ const char
> > +*env_ext4_get_dev_part(void);
> 
> A "get device and partition" function is not supposed to set anything?

Yes, I will update the comment.
 
> Best regards,
> 
> Wolfgang Denk
> 
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de A
> Puritan is someone who is deathly afraid that  someone,  somewhere, is having
> fun.

Thanks,

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
