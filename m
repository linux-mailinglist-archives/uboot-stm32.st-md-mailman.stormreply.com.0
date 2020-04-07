Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F721A0FAE
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Apr 2020 16:54:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8EB0C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Apr 2020 14:54:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45ECCC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 14:54:37 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 037Er17w027173; Tue, 7 Apr 2020 16:54:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=RJFna/r9Ut0xvZDNksSw7ozBvyzF4Douc3LFrEUjI+A=;
 b=wWmFRnP2dYIo5HPeHDQmjWN+6vs9FA4RLzh+RGWNJxl8qkfPIfmSbHAOPtWib0Lzcez8
 Q7QF0Xm92kzsT+wF+FL7DhSNCFc783WBmmXqjr4W+nb+nQj18DwMq0RVa9IQVTVj2AeF
 FhBb0hqJ0qLUw32sQ7+QrdKcMoZPKtaWXkjI1SSpCLKmdj5CdGDChO3BvCyY9zi034E6
 V19yRvl8Lr9DzF5GoQhyzSNxYiX5C33xp/ABRp8GeH+NPXMjzgBKogoiZcnMH2622UUt
 mrEU/asielaFscrIQmVGK75J7o/a42szIvB/tQn91vfw3noVpt+5HmubwCvwvuYZyw/9 OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 306g0w8prj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 16:54:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B0F710002A;
 Tue,  7 Apr 2020 16:54:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D23A2B3A72;
 Tue,  7 Apr 2020 16:54:32 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 7 Apr
 2020 16:54:32 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 7 Apr 2020 16:54:31 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>
Thread-Topic: [PATCH 04/16] arm: stm32mp: detect U-Boot version used to save
 environment
Thread-Index: AQHWB3YfT7SwvWO1Jk6hh3Y/j8AwdahkAEKAgAnFTxA=
Date: Tue, 7 Apr 2020 14:54:31 +0000
Message-ID: <8607d1778bcd4035807908e4a3a90381@SFHDAG6NODE3.st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331160456.26254-1-patrick.delaunay@st.com>
 <20200401112615.931A024003E@gemini.denx.de>
In-Reply-To: <20200401112615.931A024003E@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_07:2020-04-07,
 2020-04-07 signatures=0
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 04/16] arm: stm32mp: detect U-Boot version
 used to save environment
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

Dear Wolfgang,

> From: Wolfgang Denk <wd@denx.de>
> Sent: mercredi 1 avril 2020 13:26
> 
> Dear Patrick Delaunay,
> 
> In message <20200331160456.26254-1-patrick.delaunay@st.com> you wrote:
> > Imply CONFIG_VERSION_VARIABLE for stm32mp1 target and test U-Boot
> > version ($env_ver) when the environment was saved for the last time
> > and to display warning trace.
> 
> What is env_ver?  Are you by chance reinventing the wheel?

The script env_check is ;
 
	env exists env_ver || env set env_ver ${ver};

	if env info -p -d -q; then env save; fi;

	if test \"$env_ver\" != \"$ver\"; then
		echo \"*** Warning: old environment ${env_ver}\";
		echo '* set default: env default -a; env save; reset';
		echo '* update current: env set env_ver ${ver}; env save';
	fi;

In the first line of the script: "env exists env_ver || env set env_ver ${ver}", so

$env_ver = $ver, before the first env_save during the first boot (second line of the script)
 
> The U-Boot version is stored in the environment variable "ver"; there should be no
> need for something similar.
> 
> 
> Also. where is $env_ver coming from? It does not exist in mainline, nor in any of
> the 3 patches that preceed this patch # 4/16 ?

env_ver is only defined and used in this script to detect that current U-Boot version ($ver) and 
the version of U-Boot for last env save ($env_var) are not aligned.

I introduce this warning after debug of many issue around this kind of error, but perhaps more
a debug feature.

So if you found that it is a bad idea for upstream, I will drop this part and just to the new quiet option
To simplify the test:

env_check = " if env info -p -d -q; then env save; fi;"

> Best regards,
> 
> Wolfgang Denk

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
