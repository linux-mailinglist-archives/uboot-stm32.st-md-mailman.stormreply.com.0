Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4DA338943
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 10:52:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E503C57183;
	Fri, 12 Mar 2021 09:52:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58CC5C56631
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 09:52:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12C9hCql023345; Fri, 12 Mar 2021 10:52:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=67AfoAHNNm1t1BGTv06H3fAd+vIFlOrJ9C4HkOZ7Uoc=;
 b=EtKi6MQj10ZuuCu0DBekGPR8KgSqAWBDFy2CjTahST01CrvA2knuKE5XARMTcA+sCwIj
 g+jZnBpbDLLd9iaHaPU9Fp7Tq3BMqU3ncKN1/kZIpJt6u1gW0m6yWK/SrVSd13DWmhZx
 mK9uHqxi82CWt9YFXKQ8KhtqTgUlQgk61QIEEjX4TfkZNDTOV2lzFX6x6uZysHZqS774
 fYPAWxP2fhOgIjhoVydL4KCh3jsZkIiu8bEr28evSXwRdd5QhCSRxVdipZccjjoTR9Wf
 5lxjD/PSadHJ5BruppGOHZSY5Pj3bEao7Ev1Q8BvOhutaEx6Yh/E3Aj3SI0R4bNgZqjf Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrf50dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 10:52:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC03610002A;
 Fri, 12 Mar 2021 10:52:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8EA62326CE;
 Fri, 12 Mar 2021 10:52:41 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 10:52:41 +0100
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224125327.21937-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <74458edd-be41-8f3f-b220-f81130274f35@foss.st.com>
Date: Fri, 12 Mar 2021 10:52:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224125327.21937-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: Fix compilation issue when
 SYS_DCACHE_OFF and/or SYS_DCACHE_SYS are enabled
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgUGF0cmljZSwKCk9uIDIvMjQvMjEgMTo1MyBQTSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+
IEZyb206IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4KPgo+IEZpeCBm
b2xsb3dpbmcgY29tcGlsYXRpb24gaXNzdWUgd2hlbiBTWVNfRENBQ0hFX09GRiBhbmQvb3IgU1lT
X0RDQUNIRV9TWVMKPiBhcmUgZW5hYmxlZCA6Cj4KPiBhcmNoL2FybS9tYWNoLXN0bTMybXAvY3B1
LmM6IEluIGZ1bmN0aW9uIOKAmGVhcmx5X2VuYWJsZV9jYWNoZXPigJk6Cj4gYXJjaC9hcm0vbWFj
aC1zdG0zMm1wL2NwdS5jOjIyMzoxMDogZXJyb3I6IOKAmHZvbGF0aWxlIHN0cnVjdCBhcmNoX2ds
b2JhbF9kYXRh4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYdGxiX3NpemXigJkKPiAgICAyMjMg
fCAgZ2QtPmFyY2gudGxiX3NpemUgPSBQR1RBQkxFX1NJWkU7Cj4gICAgICAgIHwgICAgICAgICAg
Xgo+IGFyY2gvYXJtL21hY2gtc3RtMzJtcC9jcHUuYzoyMjQ6MTA6IGVycm9yOiDigJh2b2xhdGls
ZSBzdHJ1Y3QgYXJjaF9nbG9iYWxfZGF0YeKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmHRsYl9h
ZGRy4oCZCj4gICAgMjI0IHwgIGdkLT5hcmNoLnRsYl9hZGRyID0gKHVuc2lnbmVkIGxvbmcpJmVh
cmx5X3RsYjsKPiAgICAgICAgfCAgICAgICAgICBeCj4KPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNl
IENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUGF0cmlj
ZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gLS0tCj4KPiAgIGFyY2gv
YXJtL21hY2gtc3RtMzJtcC9jcHUuYyB8IDYgKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+CgoKUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVs
YXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+CgpUaGFua3MKUGF0cmljawpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
