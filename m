Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 755FC3982CE
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Jun 2021 09:16:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0030EC57B6F;
	Wed,  2 Jun 2021 07:16:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DAF1C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 07:16:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152773pA010257; Wed, 2 Jun 2021 09:16:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=rMneD37IGBaCKOX0FdJtFgmlLpBiuHBHR1cDvTqr6/4=;
 b=jS12HtsynwAbeOksGt3z8on0hNjvVW51ERnjtit6IgZ1UEBKp5zlG/A2EqT173yVHJiq
 D7fIVLlcOu8A6lDn4JP8o9NfXG5oaTyeqT0rmgu2BMcb34jav1sO0gUU/IbaeB4fMlIf
 OAkMOxhuPtZCMBwXGXJhgjCsiH6LVXAU/92HktkuY6sktQaLmq5juNTXSwqEToNTHhv0
 Naj/zm8CTxviAk50wNyonFbZeIL17LwKuvuENPpzbsWC2vymEZ2tOGllEWbekiJ3kPq/
 39iBK19lCEOOW8aoHUxvddPT83mfZCQEBUKCo1v6f3blT6zFCiRJ/zzvPkL5X0B0fKBv TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38x3gus9dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 09:16:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4115F10006D;
 Wed,  2 Jun 2021 09:16:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FCD52128B7;
 Wed,  2 Jun 2021 09:16:10 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 2 Jun
 2021 09:16:09 +0200
To: <u-boot@lists.denx.de>, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <cover.1622220270.git.gszymaszek@short.pl>
 <8135659df2b668782d04ee8dc5f352a04e92f1c0.1622220270.git.gszymaszek@short.pl>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <c8595078-c4fa-9854-1f9b-9efd7f174aa2@foss.st.com>
Date: Wed, 2 Jun 2021 09:16:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8135659df2b668782d04ee8dc5f352a04e92f1c0.1622220270.git.gszymaszek@short.pl>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_02:2021-06-01,
 2021-06-02 signatures=0
Subject: Re: [Uboot-stm32] [PATCH 1/5] arm: dts: stm32mp157c-odyssey-som:
 fix the basic SDMMC2 properties
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgR3J6ZWdvcnoKCk9uIDUvMjgvMjEgNjo1MyBQTSwgR3J6ZWdvcnogU3p5bWFzemVrIHdyb3Rl
Ogo+IFRoZSBTRE1NQzIgaW50ZXJmYWNlIGhvc3RzIGFuIGVNTUMuIFJlcGxhY2UgdGhlIGludGVy
ZmFjZSBwcm9wZXJ0aWVzCj4gdGhhdCB3b3VsZCBvbmx5IGFwcGx5IHRvIFNEIGNhcmRz4oCU4oCc
YnJva2VuLWNk4oCdIGFuZCDigJxkaXNhYmxlLXdw4oCd4oCUd2l0aAo+IHJlbGV2YW50IG9uZXM6
IOKAnG5vbi1yZW1vdmFibGXigJ0sIOKAnG5vLXNk4oCdIGFuZCDigJxuby1zZGlv4oCdLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEdyemVnb3J6IFN6eW1hc3playA8Z3N6eW1hc3pla0BzaG9ydC5wbD4K
PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gQ2M6
IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gLS0tCj4g
IGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpIHwgNSArKystLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaSBiL2FyY2gv
YXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpCj4gaW5kZXggODNmZjJlN2NlMS4u
NWM3NThiMGY3MiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2Mtb2R5c3Nl
eS1zb20uZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5k
dHNpCj4gQEAgLTI2Myw4ICsyNjMsOSBAQAo+ICAJcGluY3RybC0wID0gPCZzZG1tYzJfYjRfcGlu
c19hPjsKPiAgCXBpbmN0cmwtMSA9IDwmc2RtbWMyX2I0X29kX3BpbnNfYT47Cj4gIAlwaW5jdHJs
LTIgPSA8JnNkbW1jMl9iNF9zbGVlcF9waW5zX2E+Owo+IC0JYnJva2VuLWNkOwo+IC0JZGlzYWJs
ZS13cDsKPiArCW5vbi1yZW1vdmFibGU7Cj4gKwluby1zZDsKPiArCW5vLXNkaW87Cj4gIAlzdCxu
ZWctZWRnZTsKPiAgCWJ1cy13aWR0aCA9IDw0PjsKPiAgCXZtbWMtc3VwcGx5ID0gPCZ2M3YzPjsK
PiAKUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3Qu
Y29tPgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
